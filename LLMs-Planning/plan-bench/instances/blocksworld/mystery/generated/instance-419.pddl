(define (problem BW-generalization-4)
(:domain mystery-4ops)(:objects j f g b a i k l d)
(:init 
(harmony)
(planet j)
(planet f)
(planet g)
(planet b)
(planet a)
(planet i)
(planet k)
(planet l)
(planet d)
(province j)
(province f)
(province g)
(province b)
(province a)
(province i)
(province k)
(province l)
(province d)
)
(:goal
(and
(craves j f)
(craves f g)
(craves g b)
(craves b a)
(craves a i)
(craves i k)
(craves k l)
(craves l d)
)))