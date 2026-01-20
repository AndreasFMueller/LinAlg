/*
 * spielend.pov
 *
 * (c) 2023 Prof Dr Andreas Müller
 */
#include "common.inc"
#include "../../common/common.inc"

object {
	shamizen()
	rotate <0, 0, 60>
}

object {
	arrow(O, E3, 0.01, Red)
	rotate <0, 0, 60>
}

intersection {
	cylinder { <0,0,-0.001>, <0,0,0.001>, 0.6 }
	plane { E1, 0 }
	plane { <-0.5,-sqrt(3)/2, 0>, 0}
	pigment {
		color winkelfarbe
	}
	finish {
		metallic
		specular 0.99
	}
}

achsen()

