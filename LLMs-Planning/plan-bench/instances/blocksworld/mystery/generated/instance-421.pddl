(define (problem BW-generalization-4)
(:domain mystery-4ops)(:objects g f e h k l j i c b a)
(:init 
(harmony)
(planet g)
(planet f)
(planet e)
(planet h)
(planet k)
(planet l)
(planet j)
(planet i)
(planet c)
(planet b)
(planet a)
(province g)
(province f)
(province e)
(province h)
(province k)
(province l)
(province j)
(province i)
(province c)
(province b)
(province a)
)
(:goal
(and
(craves g f)
(craves f e)
(craves e h)
(craves h k)
(craves k l)
(craves l j)
(craves j i)
(craves i c)
(craves c b)
(craves b a)
)))