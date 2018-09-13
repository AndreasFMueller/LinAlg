//
// schnittgerade.pov -- display standard coordinate system
//
// (c) 2018 Prof Dr Anderas Müller, Hochschule Rapperswil
//
#version 3.7;
#include "colors.inc"
#include "../../0-common/common.inc"

global_settings {
	assumed_gamma 1
}

#declare imagescale = 0.41;

#declare O = <0, 0.2, -0.4>;
#declare e1 = <1, 0, 0>;
#declare e2 = <0, 0, 1>;
#declare e3 = <0, 1, 0>;

#declare at = 0.04;

camera {
	location <0.4, 4.3, -10>
	look_at <0.4, 1.485, 0.5>
	right 16/9 * x * imagescale
	up y * imagescale
}

light_source {
	<-4, 4, -3> color White
	area_light <0.1,0,0> <0,0,0.1>, 20, 20
	adaptive 1
	jitter
}

sky_sphere {
	pigment {
		color rgb<1,1,1>
	}
}

//
// Koordinatensystem
//
sphere {
	O, 1.3*at
	pigment {
		color Red
	}
}

union {
	cylinder { O - 10 * e1, O + 10 * e1, at / 3 }
	cylinder { O - 10 * e2, O + 100 * e2, at / 3 }
	cylinder { O - 10 * e3, O + 10 * e3, at / 3 }
	pigment {
		color White
	}
	finish {
		specular 0.9
		metallic
	}
}

arrow(O, O + e1, at, White)
arrow(O, O + e2, at, White)
arrow(O, O + e3, at, White)

//
// Schnittgerade
//
#declare geradeP0 = <3,0.2,0.1>;
#declare geradeP1 = <-1,2,2>;

//union {
//	sphere { geradeP0, at }
//	sphere { geradeP1, at }
//	pigment {
//		color Red
//	}
//}

#declare geradeR = vnormalize(geradeP1 - geradeP0);
#declare geradeP = geradeP0 + 0.5 * geradeR;
#macro gerade(s)
	geradeP + s * geradeR
#end

arrow(geradeP, geradeP + geradeR, at, Red)
cylinder {
	gerade(-3), gerade(10), at / 1.5
	pigment {
		color Red
	}
}

arrow(O, geradeP, at, Orange)

#declare gridt = at / 3;

//
// steilere Ebene
//
#declare ebene1UR = <4,3.5,3>;
#declare ebene1U = vnormalize(geradeP0 - ebene1UR);
#declare ebene1LR = geradeP0 + 0.5 * ebene1U;
#declare ebene1UL = geradeP1 - 1.5 * ebene1U;
#declare ebene1V = vnormalize(ebene1UL - ebene1UR);
#declare ebene1LL = ebene1LR + (ebene1UL - ebene1UR);

#declare u1min = -0.5;
#declare u1max = vdot(ebene1LL - ebene1UL, ebene1U) + u1min;
#declare v1min = -0.5;
#declare v1max = vdot(ebene1LL - ebene1LR, ebene1V) + v1min;
#declare ebene1P = ebene1UR - u1min * ebene1U - v1min * ebene1V;
#macro ebene1(uvar, vvar)
	ebene1P + uvar * ebene1U + vvar * ebene1V
#end

union {
//	sphere { ebene1UR, at }
//	sphere { ebene1LR, at }
//	sphere { ebene1UL, at }
//	sphere { ebene1LL, at }
	sphere { ebene1P, at }
	pigment {
		color Blue
	}
}

#declare ebene1farbe = rgb<0.8, 0.8, 1>;
#declare ebene1farbet = rgbt<0.8, 0.8, 1, 0.05>;
#declare ebene1vektoren = rgb<0.0, 0.4, 1>;

mesh {
	triangle { ebene1UR, ebene1UL, ebene1LL }
	triangle { ebene1UR, ebene1LL, ebene1LR }
	pigment {
		color ebene1farbet
	}
}

union {
	#declare uindex = 0;
	#while (uindex < u1max)
		cylinder { ebene1(uindex, v1min), ebene1(uindex, v1max), gridt }
		#declare uindex = uindex + 1;
	#end
	#declare vindex = 0;
	#while (vindex < v1max)
		cylinder { ebene1(u1min, vindex), ebene1(u1max, vindex), gridt }
		#declare vindex = vindex + 1;
	#end
	pigment {
		color ebene1farbe
	}
}

arrow(O, ebene1P, at, ebene1vektoren)
arrow(ebene1P, ebene1P + ebene1U, at, ebene1vektoren)
arrow(ebene1P, ebene1P + ebene1V, at, ebene1vektoren)

//
// flache Ebene
//
#declare ebene2LL = <-3,2.4,-0.8>;
#declare ebene2U = -vnormalize(ebene2LL - geradeP1);
#declare ebene2LR = geradeP0 - 0.5 * ebene2U;
#declare ebene2UL = geradeP1 + ebene2U;
#declare ebene2V = vnormalize(ebene2LR - ebene2LL);
#declare ebene2UR = ebene2UL + (ebene2LR - ebene2LL);

#declare u2min = -0.5;
#declare u2max = vdot(ebene2UL - ebene2LL, ebene2U) + u2min;
#declare v2min = -0.5;
#declare v2max = vdot(ebene2LR - ebene2LL, ebene2V) + v2min;
#declare ebene2P = ebene2LL - u2min * ebene2U - v2min * ebene2V;
#macro ebene2(uvar, vvar)
	ebene2P + uvar * ebene2U + vvar * ebene2V
#end

union {
//	sphere { ebene2LL, at }
//	sphere { ebene2LR, at }
//	sphere { ebene2UR, at }
//	sphere { ebene2UL, at }
	sphere { ebene2P, at }
	pigment {
		color Green
	}
}

#declare ebene2farbe = rgb<0.8, 1, 0.8>;
#declare ebene2farbet = rgbt<0.8, 1, 0.8, 0.05>;
#declare ebene2vektoren = rgb<0.2, 0.6, 0>;

mesh {
	triangle { ebene2UR, ebene2UL, ebene2LL }
	triangle { ebene2UR, ebene2LL, ebene2LR }
	pigment {
		color ebene2farbet
	}
}

union {
	#declare uindex = 0;
	#while (uindex < u2max)
		cylinder { ebene2(uindex, v2min), ebene2(uindex, v2max), gridt }
		#declare uindex = uindex + 1;
	#end
	#declare vindex = 0;
	#while (vindex < v2max)
		cylinder { ebene2(u2min, vindex), ebene2(u2max, vindex), gridt }
		#declare vindex = vindex + 1;
	#end
	pigment {
		color ebene2farbe
	}
}

arrow(O, ebene2P, at, ebene2vektoren)

arrow(ebene2P, ebene2P + ebene2U, at, ebene2vektoren)
arrow(ebene2P, ebene2P + ebene2V, at, ebene2vektoren)
