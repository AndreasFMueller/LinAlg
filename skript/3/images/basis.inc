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

#declare A = 0.6 * <2, 1.2,0.1>;
#declare B = 1.0 * <-0.8,0.5,0.8>;
#declare C = 0.9 * A + 1.1 * B;

#declare at = 0.04;

camera {
	location <1.4, 4.3, -10>
	look_at <1.4, 1.0, 0.5>
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

arrow(O, e1, at, White)
arrow(O, e2, at, White)
arrow(O, e3, at, White)

arrow(O, A, at, rgb<0.8, 0.2, 0.2>)
arrow(O, B, at, rgb<0, 0.6, 0>)

//sphere {
//	P, 1.2 * at
//	pigment {
//		color Orange
//	}
//	finish {
//		specular 0.9
//		metallic
//	}
//}

#declare umin = 0;
#declare umax = 1;
#declare vmin = 0;
#declare vmax = 1;

union {
#declare uindex = umin;
#while (uindex < umax + 0.5)
	cylinder {
		uindex * A + (vmin - 0.5) * B,
		uindex * A + (vmax + 0.5) * B,
		at / 2.5
	}
	#declare uindex = uindex + 1;
#end

#declare uindex = umin - 0.4;
#while (uindex < umax + 0.44)
	cylinder {
		uindex * A + (vmin - 0.5) * B,
		uindex * A + (vmax + 0.5) * B,
		at / 6
	}
	#declare uindex = uindex + 0.1;
#end

#declare vindex = vmin;
#while (vindex < vmax + 0.5)
	cylinder {
		(umin - 0.5) * A + vindex * B,
		(umax + 0.5) * A + vindex * B,
		at / 2.5
	}
	#declare vindex = vindex + 1;
#end

#declare vindex = vmin - 0.4;
#while (vindex < vmax + 0.45)
	cylinder {
		(umin - 0.5) * A + vindex * B,
		(umax + 0.5) * A + vindex * B,
		at / 6
	}
	#declare vindex = vindex + 0.1;
#end

	pigment {
		//color rgb<0.2, 0.2, 1>
		color rgb<0.8,0.8,1>
	}
}

#declare a = (umin - 0.5) * A + (vmin - 0.5) * B;
#declare b = (umax + 0.5) * A + (vmin - 0.5) * B;
#declare c = (umax + 0.5) * A + (vmax + 0.5) * B;
#declare d = (umin - 0.5) * A + (vmax + 0.5) * B;

mesh {
	triangle { a, b, c }
	triangle { a, c, d }
	pigment {
		// color rgbt<0.2, 0.2, 1, 0.5>
		color rgbt<0.8,0.8,1,0.2>
	}
}

