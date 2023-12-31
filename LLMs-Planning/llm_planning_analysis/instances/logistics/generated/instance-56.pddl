(define (problem LG-generalization)
(:domain logistics-strips)(:objects c1 t1 a1 l1-0 p13 l1-5 p15 l1-6 p9 l1-2 p10 l1-1 p11 l1-4 p12 l1-7 p14 l1-3 p8 c2 t2 a2 l2-0 p21 l2-5 p23 l2-6 p17 l2-2 p18 l2-1 p19 l2-4 p20 l2-7 p22 l2-3 p16 c0 t0 a0 l0-0 p5 l0-5 p7 l0-6 p1 l0-2 p2 l0-1 p3 l0-4 p4 l0-7 p6 l0-3 p0)
(:init 
(CITY c1)
(TRUCK t1)
(AIRPLANE a1)
(LOCATION l1-0)
(in-city l1-0 c1)
(OBJ p13)
(at p13 l1-0)
(at t1 l1-0)
(LOCATION l1-5)
(in-city l1-5 c1)
(OBJ p15)
(at p15 l1-5)
(LOCATION l1-6)
(in-city l1-6 c1)
(OBJ p9)
(at p9 l1-6)
(LOCATION l1-2)
(in-city l1-2 c1)
(OBJ p10)
(at p10 l1-2)
(LOCATION l1-1)
(in-city l1-1 c1)
(OBJ p11)
(at p11 l1-1)
(LOCATION l1-4)
(in-city l1-4 c1)
(OBJ p12)
(at p12 l1-4)
(LOCATION l1-7)
(in-city l1-7 c1)
(OBJ p14)
(at p14 l1-7)
(LOCATION l1-3)
(in-city l1-3 c1)
(OBJ p8)
(at p8 l1-3)
(CITY c2)
(TRUCK t2)
(AIRPLANE a2)
(LOCATION l2-0)
(in-city l2-0 c2)
(OBJ p21)
(at p21 l2-0)
(at t2 l2-0)
(LOCATION l2-5)
(in-city l2-5 c2)
(OBJ p23)
(at p23 l2-5)
(LOCATION l2-6)
(in-city l2-6 c2)
(OBJ p17)
(at p17 l2-6)
(LOCATION l2-2)
(in-city l2-2 c2)
(OBJ p18)
(at p18 l2-2)
(LOCATION l2-1)
(in-city l2-1 c2)
(OBJ p19)
(at p19 l2-1)
(LOCATION l2-4)
(in-city l2-4 c2)
(OBJ p20)
(at p20 l2-4)
(LOCATION l2-7)
(in-city l2-7 c2)
(OBJ p22)
(at p22 l2-7)
(LOCATION l2-3)
(in-city l2-3 c2)
(OBJ p16)
(at p16 l2-3)
(CITY c0)
(TRUCK t0)
(AIRPLANE a0)
(LOCATION l0-0)
(in-city l0-0 c0)
(OBJ p5)
(at p5 l0-0)
(at t0 l0-0)
(LOCATION l0-5)
(in-city l0-5 c0)
(OBJ p7)
(at p7 l0-5)
(LOCATION l0-6)
(in-city l0-6 c0)
(OBJ p1)
(at p1 l0-6)
(LOCATION l0-2)
(in-city l0-2 c0)
(OBJ p2)
(at p2 l0-2)
(LOCATION l0-1)
(in-city l0-1 c0)
(OBJ p3)
(at p3 l0-1)
(LOCATION l0-4)
(in-city l0-4 c0)
(OBJ p4)
(at p4 l0-4)
(LOCATION l0-7)
(in-city l0-7 c0)
(OBJ p6)
(at p6 l0-7)
(LOCATION l0-3)
(in-city l0-3 c0)
(OBJ p0)
(at p0 l0-3)
(AIRPORT l1-3)
(at a1 l1-3)
(AIRPORT l2-3)
(at a2 l2-3)
(AIRPORT l0-3)
(at a0 l0-3)
)
(:goal
(and
(at p13 l1-5)
(at p15 l1-6)
(at p9 l1-2)
(at p10 l1-1)
(at p11 l1-4)
(at p12 l1-7)
(at p14 l1-3)
(at p21 l2-5)
(at p23 l2-6)
(at p17 l2-2)
(at p18 l2-1)
(at p19 l2-4)
(at p20 l2-7)
(at p22 l2-3)
(at p5 l0-5)
(at p7 l0-6)
(at p1 l0-2)
(at p2 l0-1)
(at p3 l0-4)
(at p4 l0-7)
(at p6 l0-3)
(at p8 l2-3)
(at p16 l0-3)
(at p0 l2-3)
)))