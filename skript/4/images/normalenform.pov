//
// normalenform.pov -- Normalenform einer Ebene
//
// (c) 2018 Prof Dr Andreas Müller, Hochschule Rapperswil
//
#version 3.7;
#include "colors.inc"
#include "common.inc"

global_settings {
	assumed_gamma 1
}

#declare imagescale = 0.44;

#declare at = 0.04;

#declare O = <0, 0, 0>;
#declare E1 = 2*<1, 0, 0>;
#declare E2 = 2*<0, 1, 0>;
#declare E3 = 2*<0, 0, 1>;

#declare P = <1.3, 1.9, 0.7>;
#declare uvektor = 0.4 * <3, 0, -1>;
#declare vvektor = 0.4 * <1.4, 0.27, 2>;
#declare n = vnormalize(vcross(vvektor, uvektor));
#declare Q = P + 2.9 * uvektor + 1.7 * vvektor;

#declare Qu = P + 2.9 * uvektor;
#declare Qv = P + 1.7 * vvektor;

#declare umax = 4;
#declare vmax = 3;

#declare fine = 0.01;
#declare ueber = 0.2;

#declare A = P - (   1 + ueber) * uvektor - (   1 + ueber) * vvektor;
#declare B = P + (umax + ueber) * uvektor - (   1 + ueber) * vvektor;
#declare C = P + (umax + ueber) * uvektor + (vmax + ueber) * vvektor;
#declare D = P - (   1 + ueber) * uvektor + (vmax + ueber) * vvektor;

#declare S = (A + B + C + D)/4 - 0.2 * n;

#declare blau = rgb<0, 0.2, 1>;

#macro punkt(ul, vl)
	P + ul * uvektor + vl * vvektor
#end

camera {
	location <3, 9,-9>
	look_at S
	right 16/9 * x * imagescale
	up y * imagescale
}

light_source {
	<-4, 10, -2> color White
	area_light <0.3,0,0> <0,0,0.3>, 10, 10
	adaptive 1
	jitter
}

sky_sphere {
	pigment {
		color rgb<1,1,1>
	}
}

sphere { O, 1.5 * at
	pigment {
		color Red
	}
}

sphere { P, 1.5 * at
	pigment {
		color blau
	}
}

arrow(O, E1, 0.6 * at, Gray)
arrow(O, E2, 0.6 * at, Gray)
arrow(O, E3, 0.6 * at, Gray)

union {
#declare ul = -1;
#while (ul <= umax)
	cylinder { punkt(ul, -1-ueber), punkt(ul, vmax+ueber), fine }
	sphere { punkt(ul, -1-ueber), fine }
	sphere { punkt(ul, vmax + ueber), fine }
	#declare vl = -1;
	#while (vl <= vmax)
		sphere { punkt(ul, vl), fine }
		#declare vl = vl + 1;
	#end
	#declare ul = ul + 1;
#end

#declare vl = -1;
#while (vl <= vmax)
	cylinder { punkt(-1-ueber, vl), punkt(umax + ueber, vl), fine }
	sphere { punkt(-1-ueber, vl), fine }
	sphere { punkt(umax + ueber, vl), fine }
	#declare vl = vl + 1;
#end
	pigment {
		//color blau
		color rgb<0.8,0.8,1>
	}
	finish {
		specular 0.9
		metallic
	}
}

arrow(O, P, at, Red)
arrow(P, P + uvektor, at, blau)
arrow(P, P + vvektor, at, blau)
union {
	cylinder { Q, Qu, 0.01 }
	cylinder { Q, Qv, 0.01 }
	sphere { Q, 0.01 }
	pigment {
		color Orange
	}
	finish {
		specular 0.9
		metallic
	}
}
arrow(O, Q, at, Orange)
arrow(P, Q, at, Orange)
arrow(P, P + 2 * n, at, Green)

mesh {
	triangle { A, B, C }
	triangle { A, C, D }
	pigment {
		//color rgbf<0.8, 1, 1, 0.5>
		color rgbt<0.8,0.8,1,0.2>
	}
}

#declare un = vnormalize(vcross(uvektor, n));

rechterwinkel(P, n, vnormalize(vvektor), Yellow)
rechterwinkel(P, n, vnormalize(uvektor), Yellow)
rechterwinkel(P, n, vnormalize(Q-P), Yellow)

