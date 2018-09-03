//
// vektorprodukt.pov -- display standard coordinate system
//
// (c) 2018 Prof Dr Anderas Müller, Hochschule Rapperswil
//
#version 3.7;
#include "colors.inc"
#include "../../0-common/common.inc"

global_settings {
	assumed_gamma 1
}

#declare imagescale = 0.23;

#declare O = <0, 0, 0>;
#declare A = <0.9, 0, -0.5>;
#declare B = <0.4, 0, 1.2>;
#declare C = vcross(B, A);

#declare at = 0.03;

camera {
	location <7.5, 4.3, 3>
	look_at <0.5, 0.5, 0.5>
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

union {
	cylinder { <-10,0,0>, <10,0,0>, at / 2 }
	cylinder { <0,-10,0>, <0,10,0>, at / 2 }
	cylinder { <0,0,-10>, <0,0,10>, at / 2 }
	pigment {
		color White
	}
	finish {
		specular 0.9
		metallic
	}
}

mesh {
	triangle { O, A, A+B }
	triangle { O, A+B, B }
	pigment {
		color rgbt<0.8,0.8,1,0.1>
	}
}

arrow(O, A, at, Red)
arrow(O, B, at, Green)
arrow(O, C, at, Blue)

rechterwinkel(O, vnormalize(A), vnormalize(C), rgbt<1,1,0>)
rechterwinkel(O, vnormalize(B), vnormalize(C), rgbt<1,1,0>)
