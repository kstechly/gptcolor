(define (problem BW-generalization-4)
(:domain mystery-4ops)(:objects h e d k b i g)
(:init 
(harmony)
(planet h)
(planet e)
(planet d)
(planet k)
(planet b)
(planet i)
(planet g)
(province h)
(province e)
(province d)
(province k)
(province b)
(province i)
(province g)
)
(:goal
(and
(craves h e)
(craves e d)
(craves d k)
(craves k b)
(craves b i)
(craves i g)
)))