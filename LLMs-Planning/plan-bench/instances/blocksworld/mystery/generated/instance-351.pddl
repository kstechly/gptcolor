(define (problem BW-generalization-4)
(:domain mystery-4ops)(:objects e c a i b h j d l f)
(:init 
(harmony)
(planet e)
(planet c)
(planet a)
(planet i)
(planet b)
(planet h)
(planet j)
(planet d)
(planet l)
(planet f)
(province e)
(province c)
(province a)
(province i)
(province b)
(province h)
(province j)
(province d)
(province l)
(province f)
)
(:goal
(and
(craves e c)
(craves c a)
(craves a i)
(craves i b)
(craves b h)
(craves h j)
(craves j d)
(craves d l)
(craves l f)
)))