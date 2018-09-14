//
// ebene.pov -- display standard coordinate system
//
// (c) 2018 Prof Dr Anderas Müller, Hochschule Rapperswil
//
#version 3.7;
#include "colors.inc"
#include "../../0-common/common.inc"

global_settings {
	assumed_gamma 1
}

#declare imagescale = 0.35;

#declare O = <0, 0, 0>;
#declare e1 = <1, 0, 0>;
#declare e2 = <0, 0, 1>;
#declare e3 = <0, 1, 0>;
#declare P = <0, 1, 0>;
#declare U = <1, 0, 0>;
#declare V = <0, 0, 1>;

#declare at = 0.04;

camera {
	location <1.4, 4.3, -10>
	look_at <1.4, 1.4, 0.5>
	right 16/9 * x * imagescale
	up y * imagescale
}

light_source {
	<-3, 4, -3> color White
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

union {
	cylinder { <-10,0,0>, <10,0,0>, at / 3 }
	cylinder { <0,-10,0>, <0,10,0>, at / 3 }
	cylinder { <0,0,-10>, <0,0,100>, at / 3 }
	pigment {
		color White
	}
	finish {
		specular 0.9
		metallic
	}
}

arrow(O, e1, 0.9 * at, White)
arrow(O, e2, 0.9 * at, White)
arrow(O, e3, 0.9 * at, White)

arrow(O, P, at, Orange)
sphere {
	P, 1.2 * at
	pigment {
		color Orange
	}
	finish {
		specular 0.9
		metallic
	}
}

#declare umin = 0;
#declare umax = 1;
#declare vmin = 0;
#declare vmax = 2;

union {
#declare uindex = umin;
#while (uindex < umax + 0.5)
	cylinder {
		P + uindex * U + (vmin - 0.5) * V,
		P + uindex * U + (vmax + 0.5) * V,
		at / 3
	}
	#declare uindex = uindex + 1;
#end
#declare vindex = vmin;
#while (vindex < vmax + 0.5)
	cylinder {
		P + (umin - 0.5) * U + vindex * V,
		P + (umax + 0.5) * U + vindex * V,
		at / 3
	}
	#declare vindex = vindex + 1;
#end
	pigment {
		color rgb<0.2, 0.2, 1>
	}
}

#declare A = P + (umin - 0.5) * U + (vmin - 0.5) * V;
#declare B = P + (umax + 0.5) * U + (vmin - 0.5) * V;
#declare C = P + (umax + 0.5) * U + (vmax + 0.5) * V;
#declare D = P + (umin - 0.5) * U + (vmax + 0.5) * V;

mesh {
	triangle { A, B, C }
	triangle { A, C, D }
	pigment {
		color rgbt<0.2, 0.2, 1, 0.5>
	}
}

arrow(P, P+U, at, rgb<0.8, 0.2, 0.2>)
arrow(P, P+V, at, rgb<0, 0.6, 0>)
