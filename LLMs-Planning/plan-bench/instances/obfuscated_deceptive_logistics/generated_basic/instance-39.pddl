
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Instance file automatically generated by the Tarski FSTRIPS writer
;;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (problem instance-39)
    (:domain obfuscated_deceptive_logistics)

    (:objects
        o0 o1 o10 o11 o12 o13 o14 o15 o16 o2 o3 o4 o5 o6 o7 o8 o9 - object
    )

    (:init
        (cats o0)
        (stupendous o1)
        (stupendous o2)
        (sneeze o4)
        (sneeze o3)
        (texture o6)
        (texture o8)
        (texture o7)
        (texture o10)
        (texture o9)
        (texture o5)
        (collect o10 o2)
        (collect o8 o2)
        (collect o5 o1)
        (collect o9 o2)
        (collect o6 o1)
        (collect o7 o1)
        (spring o8)
        (spring o5)
        (hand o12)
        (hand o13)
        (hand o11)
        (hand o14)
        (hand o15)
        (hand o16)
        (next o4 o9)
        (next o16 o6)
        (next o12 o9)
        (next o11 o8)
        (next o0 o5)
        (next o13 o10)
        (next o14 o9)
        (next o3 o5)
        (next o15 o6)
    )

    (:goal
        (and (next o13 o7) (next o16 o6) (next o11 o5) (next o12 o9) (next o14 o5) (next o15 o8))
    )

    
    
    
)

