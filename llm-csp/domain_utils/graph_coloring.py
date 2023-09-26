DEFAULT_PROMPT_START = "Color the following graph, described as a set of edges, such that no two vertices on the same edge share a color.\n"
PROMPT_SPLITTER = "Please do not provide anything else in your response."
DEFAULT_PROMPT_END = "Please provide each vertex's color. Do not skip any vertices. Each color must be provided on a new line in the response and should be formatted as \"{VERTEX NUMBER}: {VERTEX COLOR ASSIGNMENT}\". " + PROMPT_SPLITTER

CHROMATIC_NUMBER_KEY = "OPTIMAL CHROMATIC NUMBER === "
GRAPH_COLORING_DIRECTORY = "../data/graph_coloring/"

INITIAL_NODES = 3
NEIGHBOR_P = .4
SOURCE_P = .2

import grinpy
import os
import argparse
import matplotlib.pyplot as plt
import json
import time
import re

def parse_dimacs(instance_text):
    parsed = []
    for line in str(instance_text).split("\n"):
        text = line.split(" ")
        if text[0] == "e":
            parsed.append((text[1],text[2]))
    return parsed

def construct_dimacs(parsed_graph):
    dimacs = ""
    for edge in parsed_graph:
        dimacs+=f"\ne {edge[0]} {edge[1]}"
    return dimacs

def optimal_coloring_number(instance_text):
    if CHROMATIC_NUMBER_KEY in instance_text:
        return instance_text.split(CHROMATIC_NUMBER_KEY)[1].split("\n")[0]
    graph = grinpy.Graph(parse_dimacs(instance_text))
    return grinpy.chromatic_number(graph)

def check_coloring(model_response, instance_text):
    coloring = {}
    for line in model_response.split("\n"):
        assignment = line.strip().split(": ")
        if len(assignment) < 2:
            continue
        vertex_number = assignment[0]
        color = assignment[1]
        coloring[vertex_number] = color
    edges = parse_dimacs(instance_text)
    # check if coloring is valid
    for edge in edges:
        if edge[0] not in coloring:
            return f"Vertex {edge[0]} was not given a value in the coloring. {DEFAULT_PROMPT_END}"
        if edge[1] not in coloring:
            return f"Vertex {edge[1]} was not given a value in the coloring. {DEFAULT_PROMPT_END}"
        if coloring[edge[0]] == coloring[edge[1]]:
            return f"Vertex {edge[0]} and vertex {edge[1]} were both colored {coloring[edge[0]]} despite being connected by an edge.\nThis is wrong. Please recolor. {DEFAULT_PROMPT_END}"
    # check if coloring is optimal
    optimal_num = int(optimal_coloring_number(instance_text))
    if optimal_num == len(set(coloring.values())):
        return ""
    else: 
        return f"This coloring is not optimal. It uses {len(set(coloring.values()))} colors, when only {int(optimal_coloring_number(instance_text))} are necessary.\n Please recolor. {DEFAULT_PROMPT_END}"

def generate_random_graph(num_nodes, edge_p):
    graph_attempt = grinpy.gnp_random_graph(num_nodes, edge_p)
    num_tries = 1
    while not grinpy.is_planar(graph_attempt):
        graph_attempt = grinpy.gnp_random_graph(num_nodes, edge_p)
        print(f"Try #{num_tries}")
        num_tries+=1
    return graph_attempt

def generate_graph(instance_text):
    prompt = ""
    num_verts = 0
    min_vert = 1
    for edge in parse_dimacs(instance_text):
        prompt += f"Vertex {edge[0]} is connected to vertex {edge[1]}.\n"
        num_verts = max(num_verts, int(edge[0]),int(edge[1]))
        min_vert = min(min_vert, int(edge[0]), int(edge[1]))
    num_verts += (min_vert+1)%2
    return num_verts, prompt

#### Required Functions

def file_ending():
    return ".col"

def generate(instance_text):
    prompt = DEFAULT_PROMPT_START
    prompt += f"You may use at most {optimal_coloring_number(instance_text)} colors.\n"
    num_verts, graph_text = generate_graph(instance_text)
    prompt += graph_text
    prompt+=f"There are a total of {num_verts} vertices. Please label every vertex, even if it is disconnected from the rest of the graph."
    prompt += DEFAULT_PROMPT_END
    return prompt  

def evaluate(instance_text, response_trace):
    evaluation = {}
    edges = parse_dimacs(instance_text)
    graph = grinpy.Graph(edges)
    response_keys = [x for x in response_trace if "response" in x]
    evaluation["correct"] = not check_coloring(response_trace[max(response_keys)], instance_text)
    for x in response_keys:
        evaluation[x] = not check_coloring(response_trace[x], instance_text)
    evaluation["number of backprompts"] = len(response_keys)-1
    #TODO
    #correct, missing, incorrect = 0
    #TODO: loop over the backprompts?
    #evaluation["correct backprompt phrases"] = 
    #evaluation["missing backprompt phrases"] =
    #evaluation["incorrect backprompt phrases"] =

    #TODO check if it repeats itself
    #evaluation["number of unique attempts"] = 

 
    coloring = {}
    evaluation["valid assignment"] = True
    evaluation["number of errors"] = 0
    for line in response_trace[max(response_keys)].split("\n"):
        assignment = line.strip().split(": ")
        if len(assignment) < 2:
            continue
        vertex_number = assignment[0]
        color = assignment[1]
        coloring[vertex_number] = color
    for edge in edges:
        if edge[0] not in coloring:
            evaluation["valid assignment"] = False
        if edge[1] not in coloring:
            evaluation["valid assignment"] = False
        if coloring[edge[0]] == coloring[edge[1]]:
            evaluation["number of errors"] +=1
               
    #evaluation["colors used"] = 
    

    #graph stats
    num_verts, _ = generate_graph(instance_text)
    evaluation["number of nodes"] = num_verts
    evaluation["number of edges"] = grinpy.number_of_edges(graph)
    evaluation["chromatic number"] = optimal_coloring_number(instance_text)

    return evaluation

def backprompt(instance_text, model_response, backprompt_type):
    STOP_PHRASE = "Verifier confirmed success."
    if backprompt_type == "zero":
        return f"This coloring may or may not be correct. If it is correct, please repeat it. Do not provide anything else in your response. If it is not correct, provide a correct coloring. {DEFAULT_PROMPT_END}"
    elif backprompt_type == "passfail":
        check = check_coloring(model_response, instance_text)
        if not check:
            return STOP_PHRASE
        else: return f"This is not correct. Using the previously provided graph, please provide a correct coloring. {DEFAULT_PROMPT_END}"
    elif backprompt_type == "full":
        check = check_coloring(model_response, instance_text)
        if not check:
            return STOP_PHRASE
        else: return check
    elif backprompt_type == "llm-query":
        backprompt_query = f"The following graph, described as a set of edges, has an optimal coloring number of {optimal_coloring_number(instance_text)}:\n"
        num_verts, graph_text = generate_graph(instance_text)
        backprompt_query+= graph_text
        backprompt_query+= f"Please check if this coloring is correct:" +model_response
        backprompt_query+= f"\nIf it is, say '{STOP_PHRASE}' Do not provide anything else in your response. If it is incorrect, please point out which same-color vertices share an edge."
        return backprompt_query
    elif backprompt_type == "llm-wrapper":
        backprompt = "This is incorrect. Feedback:\n"
        backprompt += model_response
        backprompt += "\n\nUsing this feedback, please try again. " +DEFAULT_PROMPT_END
        return backprompt
    else: raise NotImplementedError
    

#### Precompute and instance generation scripts
# WARNING: Only works from domain_utils directory

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument('task', help='generate, chromatic, or stats'),
    parser.add_argument('-s','--start', type=int, default=1, help='start index')
    parser.add_argument('-e', '--end', type=int, default=100, help='end index')
    parser.add_argument('-t','--total', type=int, default=10, help='total number of nodes')
    parser.add_argument('-p','--probability', type=float, default=NEIGHBOR_P, help='probability of edge generation (Erdős-Rényi)')
    args = parser.parse_args()
    task = args.task
    start = args.start
    end = args.end
    total_nodes = args.total
    if task == "chromatic":
        print(f"Precomputing chromatic numbers for all instances in {GRAPH_COLORING_DIRECTORY}")
        for instance in os.listdir(GRAPH_COLORING_DIRECTORY):
            if instance.startswith("instance-"):
                with open(GRAPH_COLORING_DIRECTORY+instance,"r+") as fp:
                    instance_text = fp.read()
                    print(instance_text)
                    if CHROMATIC_NUMBER_KEY in instance_text:
                        print(f"Instance {instance} was already precomputed. Skipping.")
                        continue
                    chromatic = optimal_coloring_number(instance_text)
                    print(f"Instance {instance}'s chromatic number is {chromatic}")
                    fp.write(f"\nc {CHROMATIC_NUMBER_KEY}{chromatic}")
    elif task == "generate":
        print(f"Generating new instances from {start} to {end} in {GRAPH_COLORING_DIRECTORY}")
        for x in range(start, end+1):
            destination = f"{GRAPH_COLORING_DIRECTORY}instance-{x}.col"
            dimacs = ""
            graph = grinpy.to_edgelist(generate_random_graph(total_nodes, NEIGHBOR_P))
            dimacs = construct_dimacs(graph)
            dimacs += f"\nc {CHROMATIC_NUMBER_KEY}{optimal_coloring_number(dimacs)}"
            with open(destination, "w") as fp:
                fp.write(dimacs)
    elif task == "draw":
        print(f"Drawing labeled graph from instance {start}")
        with open(f"{GRAPH_COLORING_DIRECTORY}instance-{start}.col","r") as fp:
            d_text = fp.read()
        #d_text = "e 0 2\ne 0 4\ne 0 5\ne 1 5\ne 2 3\ne 2 4\ne 2 5\ne 3 4\ne 3 5"
        G = grinpy.Graph(parse_dimacs(d_text))
        #print(grinpy.is_planar(G))
        #print(G)
        grinpy.draw_planar(G, with_labels=True)
        plt.show()
    elif task == "stats":
        print(f"Printing stats for all instances in {GRAPH_COLORING_DIRECTORY}")
        for instance in os.listdir(GRAPH_COLORING_DIRECTORY):
            if instance.startswith("instance-"):
                with open(GRAPH_COLORING_DIRECTORY+instance,"r") as fp:
                    instance_text = fp.read()
                    G = grinpy.Graph(parse_dimacs(instance_text))
                    degs = [x[1] for x in G.degree()]
                    print(f"Max degree for {instance} is {max(degs)}")
                    print(f"Avg degree for {instance} is {sum(degs)/len(degs)}")
    elif task == "dupe":
        print(f"Checking for duplicates across all instances in {GRAPH_COLORING_DIRECTORY}")
        inst_list = []
        for instance in os.listdir(GRAPH_COLORING_DIRECTORY):
            if instance.startswith("instance-"):
                with open(GRAPH_COLORING_DIRECTORY+instance,"r") as fp:
                    instance_text = fp.read()
                    G = grinpy.Graph(parse_dimacs(instance_text))
                    for x, y in inst_list:
                        if grinpy.is_isomorphic(G,x):
                            print(f"{instance} is isomorphic to {y}")
                    inst_list.append([G, instance])
        print(f"Finished dupe check")
    elif task == "convert": 
        RESULTS_LOCATION = "../responses/graph_coloring/gpt-4_chat/backprompting-full/"
        BACKPROMPT_SPLITTER = "\nVertex"
        PROMPTS_LOCATION = "../prompts/graph_coloring/"
        print(f"Converting all instances in {RESULTS_LOCATION}responses.json")
        convert_num = 0
        total_num = 0
        results = {}
        with open(RESULTS_LOCATION+"responses.json", "r") as fp:
            old_results = json.load(fp)
        with open(PROMPTS_LOCATION+"prompts.json", "r") as fp:
            queries = json.load(fp)
        #save a copy jic
        with open(RESULTS_LOCATION+f"responses-old-{int(time.time())}.json","w") as fp:
            json.dump(old_results, fp, indent=4)
        for x in old_results:
            total_num+=1
            if not type(old_results[x]) == str:
                results[x] = old_results[x]
                continue
            splitters = PROMPT_SPLITTER, BACKPROMPT_SPLITTER
            regex_p = '|'.join(map(re.escape, splitters))
            #y = old_results[x].split(PROMPT_SPLITTER)
            y = re.split(regex_p, old_results[x])
            if len(y) <= 2:
                results[x] = {"query":queries[x]}
                results[x]["response"] = old_results[x]
                convert_num+=1
            else:
                results[x] = {"query":queries[x]}
                results[x]["response"] = y[1]
                for n in range(2, len(y)):
                    if n%2:
                        results[x][f"response {int((n-1)/2-1)}"] = y[n]
                    else: 
                        results[x][f"backprompt {int(n/2-1)}"] = BACKPROMPT_SPLITTER+y[n]+PROMPT_SPLITTER
                convert_num+=1
        with open(RESULTS_LOCATION+"responses.json", "w") as fp:
            json.dump(results, fp, indent=4)
        print(f"{convert_num} out of {total_num} converted")