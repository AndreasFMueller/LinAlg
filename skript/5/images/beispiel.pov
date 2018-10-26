//
// beispiel.pov -- Beispiel in Kapitel 5.1
//
// (c) 2018 Prof Dr Anderas Müller, Hochschule Rapperswil
//
#version 3.7;
#include "colors.inc"
#include "../../0-common/common.inc"

global_settings {
	assumed_gamma 1
}

#declare imagescale = 0.4;

#declare O = <0, 0, 0>;
#declare A = <4, 3, 1>;
#declare B = <5, 2, 1>;
#declare C1 = < 2, -3,  1>;
#declare C2 = <-2,  3, -1>;
#declare C3 = < 1/3, -4/3,  1>;
#declare C4 = <-1/3,  4/3, -1>;

#declare rechterwinkelradius = 1;
#declare YellowT = rgbt<1,1,0,0.5>;
rechterwinkel(O, B, C4, Yellow)
//rechterwinkel(O, B, C4, YellowT)
rechterwinkel(O, A, C2, Yellow)
//rechterwinkel(O, A, C2, YellowT)

#declare C = C1;
#declare D = A + B;
#declare P1 = O + C;
#declare P2 = A + C;
#declare P3 = B + C;
#declare P4 = D + C;

#declare n = <1, 1, 1>;

#declare at = 0.07;

camera {
	location <9, 17,  -14>
	look_at  <4.1, 2.3,   0.0>
	right 16/9 * x * imagescale
	up y * imagescale
}

light_source {
	<5, 10, -2> color White
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
	O, 1.8*at
	pigment {
		color White
	}
}

#declare Blau = rgb<0.2,0.2,1>;

arrow(O, A, at, Blue)
arrow(O, B, at, Red)

arrow(O, n, at, Green)

arrow(O, C1, at, Orange)
arrow(O, C2, at, Orange)
arrow(O, C3, at, Orange)
arrow(O, C4, at, Orange)

union {
	cylinder { <-100,    0,    0>, <100,   0,   0>, 0.5 * at }
	cylinder { <   0,    0, -100>, <  0,   0, 100>, 0.5 * at }
	cylinder { <   0, -100,    0>, <  0, 100,   0>, 0.5 * at }
	pigment {
		color White
	}
	finish {
		specular 0.9
		metallic
	}
}

intersection {
	plane { <1,1,1>, 0.001 }
	plane { -<1,1,1>, -0.001 }
	sphere { <0, 0, 0>, 10 }
	pigment {
		//color rgbt<1,0.6,0,0.5>
		color rgbt<0.8,1,0.8,0.5>
	}
	finish {
		specular 0.9
		metallic
	}
}

#macro parallelogram(U, V, W)
	triangle { U, V, W  }
	triangle { V, W + (V - U), W }
#end

mesh {
	parallelogram(O, A, B)
	parallelogram(P1, P2, P3)
	parallelogram(O, A, C)
	parallelogram(O, B, C)
	parallelogram(A, D, P2)
	parallelogram(B, D, P3)
	pigment {
		color rgbt<0.8,0.8,1,0.2>
	}
	finish {
		specular 0.9
		metallic
	}
}

//union {
//	sphere { E, at }
//	sphere { F, at }
//	cylinder { E, F, at/2 }
//	pigment {
//		color Red
//	}
//	finish {
//		specular 0.9
//		metallic
//	}
//}

//rechterwinkel(E, vnormalize(r), h, Yellow)
