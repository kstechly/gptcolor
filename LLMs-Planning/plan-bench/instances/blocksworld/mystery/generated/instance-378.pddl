(define (problem BW-generalization-4)
(:domain mystery-4ops)(:objects a j b d h c)
(:init 
(harmony)
(planet a)
(planet j)
(planet b)
(planet d)
(planet h)
(planet c)
(province a)
(province j)
(province b)
(province d)
(province h)
(province c)
)
(:goal
(and
(craves a j)
(craves j b)
(craves b d)
(craves d h)
(craves h c)
)))