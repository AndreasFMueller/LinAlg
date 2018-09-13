//
// coordsystem.pov -- display standard coordinate system
//
// (c) 2018 Prof Dr Anderas Müller, Hochschule Rapperswil
//
#version 3.7;
#include "colors.inc"
#include "../../0-common/common.inc"

global_settings {
	assumed_gamma 1
}

#declare imagescale = 0.36;

#declare O = <0, 0, 0>;
#declare E1 = <1, 0, 0>;
#declare E2 = <0, 0, 1>;
#declare E3 = <0, 1, 0>;

#declare A = <1.5, 0, 0>;
#declare B = <0, 0, 1.7>;
#declare C = <0, 1.2, 0>;

#declare at = 0.04;

camera {
	location <1.1, 2.3, -5>
	look_at <1.1, 0.5, 0.5>
	right 16/9 * x * imagescale
	up y * imagescale
}

light_source {
	<-1, 7, -1> color White
	area_light <0.3,0,0> <0,0,0.3>, 10, 10
	adaptive 1
	jitter
}

sky_sphere {
	pigment {
		color rgb<1,1,1>
	}
}

sphere {
	<0,0,0>, 2*at
	pigment {
		color Red
	}
}

#declare P = <-0.5, 0, -0.5>;
#declare Q = < 2.5, 0, -0.5>;
#declare R = < 2.5, 0,  2.5>;
#declare S = <-0.5, 0,  2.5>;

mesh {
	triangle { P, Q, R }
	triangle { P, R, S }
	pigment {
		color rgbt<0.4, 0.4, 1, 0.5>
	}
}

#declare axest = at / 3;

union {
	cylinder { -5 * E1, 5 * E1, axest }
	cylinder { -5 * E2, 50 * E2, axest }
	cylinder { -5 * E3, 5 * E3, axest }
	pigment {
		color White
	}
	finish {
		specular 0.9
		metallic
	}
}

arrow(O, E1, at, Gray)
arrow(O, E2, at, Gray)
arrow(O, E3, at, Gray)

#declare ct = at / 2;

union {
	cylinder { O, A, ct }
	cylinder { O, B, ct }
	cylinder { O, C, ct }
	cylinder { A, A + B, ct }
	cylinder { B, A + B, ct }
	cylinder { A+B, A+B+C, ct }
	cylinder { C, A+C, ct }
	cylinder { C, B+C, ct }
	cylinder { C+A, A+B+C, ct }
	cylinder { C+B, A+B+C, ct }
	cylinder { A, A+C, ct }
	cylinder { B, B+C, ct }
	sphere { A, ct }
	sphere { B, ct }
	sphere { C, ct }
	sphere { A + B, ct }
	sphere { A + C, ct }
	sphere { B + C, ct }
	sphere { A + B + C, ct }
	pigment {
		color rgb<0.2, 0.6, 1>
	}
	finish {
		specular 0.9
		metallic
	}
}

arrow(O, A+B+C, at, rgb<0.2, 0.6, 1>)
