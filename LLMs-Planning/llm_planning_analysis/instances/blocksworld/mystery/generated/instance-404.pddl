(define (problem BW-generalization-4)
(:domain mystery-4ops)(:objects g f i l h j b e a c)
(:init 
(harmony)
(planet g)
(planet f)
(planet i)
(planet l)
(planet h)
(planet j)
(planet b)
(planet e)
(planet a)
(planet c)
(province g)
(province f)
(province i)
(province l)
(province h)
(province j)
(province b)
(province e)
(province a)
(province c)
)
(:goal
(and
(craves g f)
(craves f i)
(craves i l)
(craves l h)
(craves h j)
(craves j b)
(craves b e)
(craves e a)
(craves a c)
)))