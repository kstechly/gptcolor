import os
import argparse
import json
from tqdm import tqdm
import domain_utils
from domain_utils import *

def evaluate_plan(engine, domain_name, specified_instances=[], ignore_existing=False, verbose=False, backprompting="", problem_type=""):
    instances_dir = f"data/{domain_name}/"
    outputs_dir = f"responses/{domain_name}/{engine}/"
    evals_dir = f"evaluations/{domain_name}/{engine}/"
    if backprompting:
        outputs_dir+=f"backprompting-{backprompting}/"
        evals_dir+=f"backprompting-{backprompting}/"
    if problem_type:
        outputs_dir+=f"{problem_type}/"
        evals_dir+=f"{problem_type}/"
    outputs_json = outputs_dir+"responses.json"
    evals_json = evals_dir+"evaluations.json"

    domain = domain_utils.domains[domain_name]

    if os.path.exists(outputs_json):
            with open(outputs_json, 'r') as file:
                output = json.load(file)
    else:
        print(f"No response data found in {outputs_dir}")
        return None
    
    prev_evals = {}
    os.makedirs(evals_dir, exist_ok=True)
    if os.path.exists(evals_json):
            with open(evals_json, 'r') as file:
                prev_evals = json.load(file)

    total_correct = 0
    total_ever_correct = 0
    total_stopped = 0
    total_stopped_correct = 0
    total_instances = 0
    evaluations = {}
    old_format = False
    for instance in tqdm(output):
        if instance in prev_evals.keys():
            if not ignore_existing:
                evaluations[instance]=prev_evals[instance]
                total_correct += int(prev_evals[instance]["correct"])
                total_ever_correct += int(prev_evals[instance]["ever correct"])
                total_stopped += int(prev_evals[instance]["stopped"])
                total_stopped_correct += int(prev_evals[instance]["stopped"] and prev_evals[instance]["correct"])
                total_instances += 1
                if verbose:
                    print(f"Instance {instance} already evaluated")
                continue
        if len(specified_instances) > 0:
            if instance+1 not in specified_instances:
                continue
            else:
                specified_instances.remove(instance)     
        
        if verbose:
            print(f"Evaluating instance {instance}")

        if type(output[instance]) == str:
            old_format = True
            raise NotImplementedError
            llm_response = output[instance]
        instance_location = f"{instances_dir}/instance-{instance}{domain.file_ending()}"
        try:
            with open(instance_location,"r") as fp:
                instance_text = fp.read()
        except FileNotFoundError:
            print(f"{instance_location} not found. Skipping.")
            continue
        evaluations[instance] = domain.evaluate(instance_text, output[instance], problem_type)

        if verbose:
            print(f"Ever correct: {evaluations[instance]['ever correct']}")
            print(f"Final correct: {evaluations[instance]['correct']}")
        total_correct += int(evaluations[instance]["correct"])
        total_ever_correct += int(evaluations[instance]["ever correct"])
        total_stopped += int(evaluations[instance]["stopped"])
        total_stopped_correct += int(evaluations[instance]["stopped"] and evaluations[instance]["correct"])
        total_instances += 1

        with open(evals_json, 'w') as file:
            json.dump(evaluations, file, indent=4)
    if verbose:
        print(f"Total correct: {total_correct}")
        print(f"Total ever correct: {total_ever_correct}")
        print(f"Total stopped: {total_stopped}")
        print(f"Total stopped correctly: {total_stopped_correct}")
        print(f"Total instances: {total_instances}")
        print(f"Ever Accuracy: {total_ever_correct/total_instances}")
        print(f"Final Accuracy: {total_correct/total_instances}")
        if old_format:
            print(f"Warning: This data contains entries in the old (string) format")


if __name__=="__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument('-e', '--engine', type=str, required=True, help='Engine to use \
                        \n gpt-4_chat = GPT-4 \
                        \n gpt-3.5-turbo_chat = GPT-3.5 Turbo \
                        \n davinci = GPT-3 Davinci \
                        \n curie = GPT-3 Curie \
                        \n babbage = GPT-3 Babbage \
                        \n ada = GPT-3 Ada \
                        ')
    parser.add_argument('-d', '--domain', type=str, required=True, help='Problem domain to evaluate within')
    parser.add_argument('-v', '--verbose', action='store_true')
    parser.add_argument('-s', '--specific_instances', nargs='+', type=int, default=[], help='List of instances to run')
    parser.add_argument('-i', '--ignore_existing', action='store_true', help='Ignore existing output')
    parser.add_argument('-b', '--backprompting', type=str, default='', help='If backprompting, provide the type of backprompt to pass to the domain. Common types: zero, passfail, full, llm')
    parser.add_argument('-p', '--problem', type=str, default='', help='If doing a domain subproblem, specify it here')
    args = parser.parse_args()
    engine = args.engine
    domain_name = args.domain
    if domain_name not in domain_utils.domains:
        raise ValueError(f"Domain name must be an element of {list(domain_utils.domains)}.")
    specified_instances = args.specific_instances
    verbose = args.verbose
    backprompting = args.backprompting
    ignore_existing = args.ignore_existing
    problem_type = args.problem
    print(f"Engine: {engine}, Domain: {domain_name}, Verbose: {verbose}, Backprompting: {bool(backprompting)}" )
    evaluate_plan(engine, domain_name, specified_instances, ignore_existing, verbose, backprompting, problem_type=problem_type)