(define (problem BW-generalization-4)
(:domain mystery-4ops)(:objects i e a c h l)
(:init 
(harmony)
(planet i)
(planet e)
(planet a)
(planet c)
(planet h)
(planet l)
(province i)
(province e)
(province a)
(province c)
(province h)
(province l)
)
(:goal
(and
(craves i e)
(craves e a)
(craves a c)
(craves c h)
(craves h l)
)))