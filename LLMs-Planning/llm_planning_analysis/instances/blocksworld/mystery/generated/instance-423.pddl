(define (problem BW-generalization-4)
(:domain mystery-4ops)(:objects d h c k l b g e)
(:init 
(harmony)
(planet d)
(planet h)
(planet c)
(planet k)
(planet l)
(planet b)
(planet g)
(planet e)
(province d)
(province h)
(province c)
(province k)
(province l)
(province b)
(province g)
(province e)
)
(:goal
(and
(craves d h)
(craves h c)
(craves c k)
(craves k l)
(craves l b)
(craves b g)
(craves g e)
)))