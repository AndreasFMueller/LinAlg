//
// abstand.pov -- display standard coordinate system
//
// (c) 2018 Prof Dr Anderas Müller, Hochschule Rapperswil
//
#version 3.7;
#include "colors.inc"
#include "../../0-common/common.inc"

global_settings {
	assumed_gamma 1
}

#declare imagescale = 0.2;

#declare O = <0, 0, 0>;
#declare P = <0.7, 1.5, -1>;
#declare r = <1.5, -0.1, 0.3>;
#declare a = <-0.7,1.5, 0.5>;

#declare A = a;
#declare B = P;
#declare C = P + r;
#declare D = a + r;

#declare n = vnormalize(vcross(r, a-P));
#declare h = vnormalize(vcross(n, r));

#macro gerade(s)
	P + s * r
#end

#declare E = gerade(0.0);
#declare F = E + vdot(a-P, h) * h;

#declare at = 0.03;

camera {
	location <1.5, 8.3, -10>
	look_at <1.5, 1, 0>
	right 16/9 * x * imagescale
	up y * imagescale
}

light_source {
	<-3, 4, -1> color White
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
	O, 1.5*at
	pigment {
		color Red
	}
}

#declare Blau = rgb<0.2,0.2,1>;

arrow(O, P, at, Blau)
arrow(P, P + r, at, Blau)
cylinder{ gerade(-5), gerade(5), at/2
	pigment {
		color Blau
	}
	finish {
		specular 0.9
		metallic
	}
}
arrow(O, a, at, Green)

mesh {
	triangle { A, B, C }
	triangle { A, C, D }
	pigment {
		color rgb<0.8,0.8,1>
	}
	finish {
		specular 0.9
		metallic
	}
}

union {
	sphere { E, at }
	sphere { F, at }
	cylinder { E, F, at/2 }
	pigment {
		color Red
	}
	finish {
		specular 0.9
		metallic
	}
}

rechterwinkel(E, vnormalize(r), h, Yellow)

//union {
//	cylinder { <-10, 0, 0>, <10, 0, 0> at/3 }
//	cylinder { <0, -10, 0>, <0, 10, 0> at/3 }
//	cylinder { <0, 0, -10>, <0, 0, 10> at/3 }
//	pigment {
//		color White
//	}
//	finish {
//		specular 0.9
//		metallic
//	}
//}
