//
// windschief.pov -- display standard coordinate system
//
// (c) 2018 Prof Dr Anderas Müller, Hochschule Rapperswil
//
#version 3.7;
#include "colors.inc"
#include "../../0-common/common.inc"

global_settings {
	assumed_gamma 1
}

#declare imagescale = 0.3;

#declare O = <0, 0, 0>;
#declare e1 = <1, 0, 0>;
#declare e2 = <0.2, 0, 1>;
#declare e3 = <0, 1, 0>;
#declare N = <-1, -1, 0.5>;

#declare at = 0.03;

camera {
	location <7.5, 3.3, 2>
	look_at <0, 0, 0>
	right 16/9 * x * imagescale
	up y * imagescale
}

light_source {
	<3, 4, -1> color White
	area_light <0.1,0,0> <0,0,0.1>, 10, 10
	adaptive 1
	jitter
}

sky_sphere {
	pigment {
		color rgb<1,1,1>
	}
}

sphere {
	O, 1.3*at
	pigment {
		color Red
	}
}

//union {
//	cylinder { <-10,0,0>, <10,0,0>, at / 2 }
//	cylinder { <0,-10,0>, <0,10,0>, at / 2 }
//	cylinder { <0,0,-10>, <0,0,10>, at / 2 }
//	pigment {
//		color White
//	}
//	finish {
//		specular 0.9
//		metallic
//	}
//}

union {
	cylinder { -10 * e1, 10 * e1, at }
	pigment {
		color rgb<0.4,0.4,1>
	}
	finish {
		specular 0.9
		metallic
	}
}
arrow(O + e1, O + 2 * e1, 1.2 * at, Blue)
arrow(N, O + e1, 1.2 * at, Blue)
sphere { O + e1, 1.8 * at
	pigment {
		color Blue
	}
	finish {
		specular 0.9
		metallic
	}
}

union {
	cylinder { e3 -10 * e2, e3 + 10 * e2, at }
	pigment {
		color rgb<0.4,1,0.4>
	}
	finish {
		specular 0.9
		metallic
	}
}
arrow(O + e3 + e2, O + e3 + 2 * e2, 1.2 * at, Green)
arrow(N, O + e3 + e2, 1.2 * at, Green)
sphere { O + e3 + e2, 1.8 * at
	pigment {
		color Green
	}
	finish {
		specular 0.9
		metallic
	}
}

union {
	cylinder { <0,0,0>, <0,1,0>, at }
	sphere { <0,0,0>, 1.5 * at }
	sphere { <0,1,0>, 1.5 * at }
	pigment {
		color Red
	}
	finish {
		specular 0.9
		metallic
	}
}

arrow(O + e1, O + e2 + e3, at, Orange)

#declare rechterwinkelradius = 0.25;
rechterwinkel(O, e1, e3, Yellow)
rechterwinkel(O + e3, e2, -e3, Yellow)
