(define (problem BW-generalization-4)
(:domain mystery-4ops)(:objects l c i e j f)
(:init 
(harmony)
(planet l)
(planet c)
(planet i)
(planet e)
(planet j)
(planet f)
(province l)
(province c)
(province i)
(province e)
(province j)
(province f)
)
(:goal
(and
(craves l c)
(craves c i)
(craves i e)
(craves e j)
(craves j f)
)))