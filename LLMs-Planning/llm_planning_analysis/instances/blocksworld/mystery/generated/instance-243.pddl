(define (problem BW-generalization-4)
(:domain mystery-4ops)(:objects h k i a l c d)
(:init 
(harmony)
(planet h)
(planet k)
(planet i)
(planet a)
(planet l)
(planet c)
(planet d)
(province h)
(province k)
(province i)
(province a)
(province l)
(province c)
(province d)
)
(:goal
(and
(craves h k)
(craves k i)
(craves i a)
(craves a l)
(craves l c)
(craves c d)
)))