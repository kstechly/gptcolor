(define (problem BW-generalization-4)
(:domain mystery-4ops)(:objects c e f h a i g)
(:init 
(harmony)
(planet c)
(planet e)
(planet f)
(planet h)
(planet a)
(planet i)
(planet g)
(province c)
(province e)
(province f)
(province h)
(province a)
(province i)
(province g)
)
(:goal
(and
(craves c e)
(craves e f)
(craves f h)
(craves h a)
(craves a i)
(craves i g)
)))