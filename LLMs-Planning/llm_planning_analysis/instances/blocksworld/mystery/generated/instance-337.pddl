(define (problem BW-generalization-4)
(:domain mystery-4ops)(:objects d g e i b a k c h)
(:init 
(harmony)
(planet d)
(planet g)
(planet e)
(planet i)
(planet b)
(planet a)
(planet k)
(planet c)
(planet h)
(province d)
(province g)
(province e)
(province i)
(province b)
(province a)
(province k)
(province c)
(province h)
)
(:goal
(and
(craves d g)
(craves g e)
(craves e i)
(craves i b)
(craves b a)
(craves a k)
(craves k c)
(craves c h)
)))