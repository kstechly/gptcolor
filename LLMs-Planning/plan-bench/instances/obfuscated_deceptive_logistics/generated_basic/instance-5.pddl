
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Instance file automatically generated by the Tarski FSTRIPS writer
;;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (problem instance-5)
    (:domain obfuscated_deceptive_logistics)

    (:objects
        o0 o1 o2 o3 o4 o5 o6 o7 o8 o9 - object
    )

    (:init
        (cats o0)
        (cats o1)
        (stupendous o2)
        (stupendous o3)
        (sneeze o4)
        (sneeze o5)
        (texture o6)
        (texture o7)
        (collect o7 o3)
        (collect o6 o2)
        (spring o6)
        (spring o7)
        (hand o8)
        (hand o9)
        (next o8 o7)
        (next o1 o6)
        (next o9 o7)
        (next o4 o6)
        (next o5 o7)
        (next o0 o6)
    )

    (:goal
        (and (next o8 o7) (next o9 o6))
    )

    
    
    
)

