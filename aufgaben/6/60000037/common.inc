/*
 * common.inc -- common definitions for problem formulation
 *
 * (c) 2023 Prof Dr Andreas Müller
 */
#version 3.7;
#include "colors.inc"
#include "textures.inc"

global_settings {
	assumed_gamma 1
}

#declare imagescale = 0.2;

#declare O = <0, 0, 0>;
#declare Cameracenter = <20, 5, 12>;
#declare Worldpoint = O;
#declare Lightsource = <70,100,30>;
#declare Lightdirection = vnormalize(Lightsource - Worldpoint);
#declare Lightaxis1 = vnormalize(vcross(Lightdirection, <0,1,0>));
#declare Lightaxis2 = vnormalize(vcross(Lightaxis1, Lightdirection));

camera {
	location Cameracenter
	look_at Worldpoint
	right 16/9 * x * imagescale
	up y * imagescale
}

light_source {
	Lightsource color White
	area_light Lightaxis1 Lightaxis2, 10, 10
	adaptive 1
	jitter
}

sky_sphere {
	pigment {
		color White
	}
}

#macro drehmatrix0()
	matrix <
		1, 0, 0,
		0, 1, 0,
		0, 0, 1,
		0, 0, 0
	>
#end

#macro punkt(mittelpunkt, r, farbe)
sphere { mittelpunkt, r
	pigment {
		color farbe
	}
	finish {
		metallic
		specular 0.99
	}
}
#end

#declare achsenfarbe = rgb<0.6,0.8,1>;

#macro achsen(r)
	arrow(O, 1.15 * r * E1, 0.012 * r, achsenfarbe)
	arrow(O, 1.15 * r * E2, 0.012 * r, achsenfarbe)
	arrow(O, 1.15 * r * E3, 0.012 * r, achsenfarbe)
#end

#declare punktfarbe1 = rgb<1.0,0.2,0.6>;
#declare punktfarbe2 = rgb<1.0,0.6,0.0>;
#declare punktfarbe3 = rgb<0.8,0.6,1.0>;

#macro erde1(r)
	erde(r)
	punkt(r * N0, 0.05, punktfarbe1)
	punkt(r * N2, 0.05, punktfarbe2)
	#declare r3 = 1.1 * r * vnormalize(vcross(N2, N0));
	arrow(O, r3, 0.03, punktfarbe3)
	cylinder { -0.001 * r3, 0.001 * r3, 1.05 * r
		pigment {
			color punktfarbe3
		}
		finish {
			metallic
			specular 0.99
		}
		no_shadow
	}
#end

#macro erde2(r)
	erde(r)
	punkt(r * S0, 0.05, punktfarbe1)
	punkt(r * S2, 0.05, punktfarbe2)
	#declare r3 = 1.1 * r * vnormalize(vcross(S2, S0));
	arrow(O, r3, 0.03, punktfarbe3)
	cylinder { -0.001 * r3, 0.001 * r3, 1.05 * r
		pigment {
			color punktfarbe3
		}
		finish {
			metallic
			specular 0.99
		}
		no_shadow
	}
#end

