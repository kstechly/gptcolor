(define (problem BW-generalization-4)
(:domain mystery-4ops)(:objects j i f h e l b k c a)
(:init 
(harmony)
(planet j)
(planet i)
(planet f)
(planet h)
(planet e)
(planet l)
(planet b)
(planet k)
(planet c)
(planet a)
(province j)
(province i)
(province f)
(province h)
(province e)
(province l)
(province b)
(province k)
(province c)
(province a)
)
(:goal
(and
(craves j i)
(craves i f)
(craves f h)
(craves h e)
(craves e l)
(craves l b)
(craves b k)
(craves k c)
(craves c a)
)))