(define (problem BW-generalization-4)
(:domain mystery-4ops)(:objects k h f e b)
(:init 
(harmony)
(planet k)
(planet h)
(planet f)
(planet e)
(planet b)
(province k)
(province h)
(province f)
(province e)
(province b)
)
(:goal
(and
(craves k h)
(craves h f)
(craves f e)
(craves e b)
)))