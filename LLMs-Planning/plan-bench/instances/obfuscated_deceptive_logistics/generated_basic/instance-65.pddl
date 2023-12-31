
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Instance file automatically generated by the Tarski FSTRIPS writer
;;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (problem instance-65)
    (:domain obfuscated_deceptive_logistics)

    (:objects
        o0 o1 o10 o11 o12 o13 o14 o15 o2 o3 o4 o5 o6 o7 o8 o9 - object
    )

    (:init
        (cats o0)
        (cats o1)
        (stupendous o4)
        (stupendous o2)
        (stupendous o3)
        (sneeze o6)
        (sneeze o7)
        (sneeze o5)
        (texture o8)
        (texture o12)
        (texture o13)
        (texture o10)
        (texture o11)
        (texture o9)
        (collect o10 o3)
        (collect o13 o4)
        (collect o8 o2)
        (collect o12 o4)
        (collect o9 o2)
        (collect o11 o3)
        (spring o10)
        (spring o8)
        (spring o12)
        (hand o15)
        (hand o14)
        (next o14 o13)
        (next o15 o11)
        (next o6 o11)
        (next o1 o10)
        (next o5 o9)
        (next o0 o8)
        (next o7 o12)
    )

    (:goal
        (and (next o15 o11) (next o14 o9))
    )

    
    
    
)

