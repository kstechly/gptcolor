(define (problem BW-generalization-4)
(:domain mystery-4ops)(:objects b f e c d k j l h)
(:init 
(harmony)
(planet b)
(planet f)
(planet e)
(planet c)
(planet d)
(planet k)
(planet j)
(planet l)
(planet h)
(province b)
(province f)
(province e)
(province c)
(province d)
(province k)
(province j)
(province l)
(province h)
)
(:goal
(and
(craves b f)
(craves f e)
(craves e c)
(craves c d)
(craves d k)
(craves k j)
(craves j l)
(craves l h)
)))