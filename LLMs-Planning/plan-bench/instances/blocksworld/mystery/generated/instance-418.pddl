(define (problem BW-generalization-4)
(:domain mystery-4ops)(:objects d e k l f i j b)
(:init 
(harmony)
(planet d)
(planet e)
(planet k)
(planet l)
(planet f)
(planet i)
(planet j)
(planet b)
(province d)
(province e)
(province k)
(province l)
(province f)
(province i)
(province j)
(province b)
)
(:goal
(and
(craves d e)
(craves e k)
(craves k l)
(craves l f)
(craves f i)
(craves i j)
(craves j b)
)))