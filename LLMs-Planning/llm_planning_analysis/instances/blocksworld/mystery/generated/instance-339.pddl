(define (problem BW-generalization-4)
(:domain mystery-4ops)(:objects j f a g i l c d h k)
(:init 
(harmony)
(planet j)
(planet f)
(planet a)
(planet g)
(planet i)
(planet l)
(planet c)
(planet d)
(planet h)
(planet k)
(province j)
(province f)
(province a)
(province g)
(province i)
(province l)
(province c)
(province d)
(province h)
(province k)
)
(:goal
(and
(craves j f)
(craves f a)
(craves a g)
(craves g i)
(craves i l)
(craves l c)
(craves c d)
(craves d h)
(craves h k)
)))