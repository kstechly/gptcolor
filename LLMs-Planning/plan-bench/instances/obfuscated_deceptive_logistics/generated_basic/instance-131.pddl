
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Instance file automatically generated by the Tarski FSTRIPS writer
;;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (problem instance-131)
    (:domain obfuscated_deceptive_logistics)

    (:objects
        o0 o1 o10 o11 o12 o13 o14 o15 o16 o17 o18 o2 o3 o4 o5 o6 o7 o8 o9 - object
    )

    (:init
        (cats o0)
        (stupendous o2)
        (stupendous o1)
        (stupendous o3)
        (sneeze o4)
        (sneeze o5)
        (sneeze o6)
        (texture o7)
        (texture o8)
        (texture o12)
        (texture o13)
        (texture o10)
        (texture o11)
        (texture o14)
        (texture o15)
        (texture o9)
        (collect o10 o2)
        (collect o15 o3)
        (collect o14 o3)
        (collect o9 o1)
        (collect o13 o3)
        (collect o8 o1)
        (collect o7 o1)
        (collect o11 o2)
        (collect o12 o2)
        (spring o10)
        (spring o7)
        (spring o13)
        (hand o18)
        (hand o17)
        (hand o16)
        (next o0 o10)
        (next o5 o10)
        (next o18 o8)
        (next o6 o14)
        (next o16 o8)
        (next o17 o11)
        (next o4 o8)
    )

    (:goal
        (and (next o17 o15) (next o18 o15) (next o16 o13))
    )

    
    
    
)

