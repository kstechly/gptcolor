(define (problem BW-generalization-4)
(:domain mystery-4ops)(:objects j a e k i h c f g)
(:init 
(harmony)
(planet j)
(planet a)
(planet e)
(planet k)
(planet i)
(planet h)
(planet c)
(planet f)
(planet g)
(province j)
(province a)
(province e)
(province k)
(province i)
(province h)
(province c)
(province f)
(province g)
)
(:goal
(and
(craves j a)
(craves a e)
(craves e k)
(craves k i)
(craves i h)
(craves h c)
(craves c f)
(craves f g)
)))