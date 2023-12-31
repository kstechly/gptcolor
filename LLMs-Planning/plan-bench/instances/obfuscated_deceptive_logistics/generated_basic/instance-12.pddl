
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Instance file automatically generated by the Tarski FSTRIPS writer
;;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (problem instance-12)
    (:domain obfuscated_deceptive_logistics)

    (:objects
        o0 o1 o10 o11 o2 o3 o4 o5 o6 o7 o8 o9 - object
    )

    (:init
        (cats o0)
        (stupendous o1)
        (stupendous o2)
        (sneeze o4)
        (sneeze o3)
        (texture o6)
        (texture o7)
        (texture o5)
        (texture o8)
        (collect o6 o1)
        (collect o7 o2)
        (collect o5 o1)
        (collect o8 o2)
        (spring o7)
        (spring o5)
        (hand o10)
        (hand o11)
        (hand o9)
        (next o9 o5)
        (next o11 o6)
        (next o0 o5)
        (next o4 o7)
        (next o10 o8)
        (next o3 o5)
    )

    (:goal
        (and (next o10 o7) (next o9 o7) (next o11 o7))
    )

    
    
    
)

