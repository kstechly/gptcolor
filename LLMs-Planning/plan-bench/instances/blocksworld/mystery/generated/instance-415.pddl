(define (problem BW-generalization-4)
(:domain mystery-4ops)(:objects i h e a g j l)
(:init 
(harmony)
(planet i)
(planet h)
(planet e)
(planet a)
(planet g)
(planet j)
(planet l)
(province i)
(province h)
(province e)
(province a)
(province g)
(province j)
(province l)
)
(:goal
(and
(craves i h)
(craves h e)
(craves e a)
(craves a g)
(craves g j)
(craves j l)
)))