/*
 * liegend.pov
 *
 * (c) 2023 Prof Dr Andreas Müller
 */
#include "common.inc"
#include "../../common/common.inc"

object {
	shamizen()
        rotate <90, 0, 0>
        rotate <0, 0, 180>
	rotate <0, -45, 0>
}
object {
	arrow(O, E2, 0.01, Red)
	rotate <0, -45, 0>
}
intersection {
	cylinder { <0, -0.001, 0>, <0, 0.001, 0>, 0.6 }
	plane { E1, 0 }
	plane { <-1, 0, -1>, 0 }
	pigment {
		color winkelfarbe
	}
	finish {
		metallic
		specular 0.99
	}
}
achsen()

