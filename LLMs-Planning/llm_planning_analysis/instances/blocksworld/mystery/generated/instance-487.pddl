(define (problem BW-generalization-4)
(:domain mystery-4ops)(:objects b k f i c d g j)
(:init 
(harmony)
(planet b)
(planet k)
(planet f)
(planet i)
(planet c)
(planet d)
(planet g)
(planet j)
(province b)
(province k)
(province f)
(province i)
(province c)
(province d)
(province g)
(province j)
)
(:goal
(and
(craves b k)
(craves k f)
(craves f i)
(craves i c)
(craves c d)
(craves d g)
(craves g j)
)))