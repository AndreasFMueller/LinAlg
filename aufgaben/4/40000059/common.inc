//
// common.inc
//
// (c) 2018 Prof Dr Andreas Müller, Hochschule Rapperswil
//
#include "colors.inc"

#declare skalierung = 1.0;

camera {
	location <2, 1, 1.5>
	look_at <0, 0.2, 0.1>
	right x * skalierung
	up y * skalierung
}

sky_sphere {
	pigment {
		color White
	}
}

light_source {
	<3,7,-1> color White
}

#declare at = 0.02;
#declare l = 1.2;

union {
	cylinder { <-l,  0,  0>,         <      l,      0,      0>, at }
	cone {     < l,  0,  0>, 2 * at, < l+4*at,      0,      0>,  0 }
	cylinder { < 0, -l,  0>,         <      0,      l,      0>, at }
	cone {     < 0,  l,  0>, 2 * at, <      0, l+4*at,      0>,  0 }
	cylinder { < 0,  0, -l>,         <      0,      0,      l>, at }
	cone {     < 0,  0,  l>, 2 * at, <      0,      0, l+4*at>,  0 }
	pigment {
		color Yellow
	}
	finish {
		specular 0.2
		metallic
	}
}

#declare w = pi * 60 / 180;

#declare A = < cos(1 * w), 0, sin(1 * w) >;
#declare B = < cos(2 * w), 0, sin(2 * w) >;
#declare C = < cos(3 * w), 0, sin(3 * w) >;
#declare D = < cos(4 * w), 0, sin(4 * w) >;
#declare E = < cos(5 * w), 0, sin(5 * w) >;
#declare F = < cos(6 * w), 0, sin(6 * w) >;
#declare S = < 0, 1, 0 >;

union {
	mesh {
		triangle { A, B, S }
		triangle { B, C, S }
		triangle { C, D, S }
		triangle { D, E, S }
		triangle { E, F, S }
		triangle { F, A, S }
		rotation()
	}
	pigment {
		color rgb<1,1,0.9>
	}
}

union {
	sphere { A, 0.05 }
	pigment {
		color Red
	}
		rotation()
}
