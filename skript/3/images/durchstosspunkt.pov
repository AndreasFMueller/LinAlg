//
// durchstosspunkt.pov -- Durchstosspunkt Gerade - Ebene
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
#declare e1 = <1, 0, 0>;
#declare e2 = <0, 0, 1>;
#declare e3 = <0, 1, 0>;

#declare P0 = <0.1, 2,  0.2>;
#declare Q0 = <4, 0, -1>;
#declare U = vnormalize(<2, -0.2, -0.5>);
#declare V = vnormalize(<0.5, 0.5, 1.5>);

#macro ebene(tval, sval)
	P0 + tval * V + sval * U
#end

#declare S = ebene(2.1,2.3);
#declare R = vnormalize(S - Q0);

#macro gerade(tval)
	Q0 + tval * R
#end

#declare at = 0.04;

camera {
	location <2.4, 4.3, -10>
	look_at <2.4, 1.4, 0.5>
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

#declare Rot = rgb<0.8, 0.2, 0.2>;
#declare Blau = rgb<0.2, 0.4, 0.8>;
#declare Gruen = rgb<0.2,0.6,0.0>;

arrow(O, e1, at, White)
arrow(O, e2, at, White)
arrow(O, e3, at, White)

arrow(O, Q0, at, Blau)

arrow(O, P0, at, Gruen)
arrow(P0, P0 + U, at, Gruen)
arrow(P0, P0 + V, at, Gruen)

arrow(Q0, Q0 + R, at, Rot)

#declare tmin = -0.5;
#declare tmax =  3.5;
#declare smin = -0.5;
#declare smax =  4.5;

#declare A = ebene(tmin, smin);
#declare B = ebene(tmax, smin);
#declare C = ebene(tmax, smax);
#declare D = ebene(tmin, smax);

union {
	#declare tindex = 0;
	#while (tindex < tmax)
		cylinder { ebene(tindex, smin), ebene(tindex, smax), at / 2 }
		#declare tindex = tindex + 1;
	#end
	#declare sindex = 0;
	#while (sindex < smax)
		cylinder { ebene(tmin, sindex), ebene(tmax, sindex), at / 2 }
		#declare sindex = sindex + 1;
	#end
	pigment {
		color rgb<0.8,0.8,1>
	}
}
mesh {
	triangle { A, B, C }
	triangle { A, C, D }
	pigment {
		color rgbt<0.8,0.8,1,0.2>
	}
}


union {
	sphere { S, 1.5 * at }
	cylinder { ebene(0, 2.3), S, at / 1.9 }
	cylinder { ebene(2.1, 0), S, at / 1.9 }
	cylinder { P0, ebene(0, 2.3), at / 1.9 }
	cylinder { P0, ebene(2.1, 0), at / 1.9 }
	sphere { ebene(0, 2.1), at / 1.9 }
	sphere { ebene(2.3, 0), at / 1.9 }
	pigment {
		color Orange
	}
	finish {
		specular 0.9
		metallic
	}
}

cylinder {
	gerade(-10), gerade(10), at/1.2
	pigment {
		color Rot
	}
	finish {
		specular 0.9
		metallic
	}
}
