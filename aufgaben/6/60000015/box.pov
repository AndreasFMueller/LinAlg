//
// box.pov 
//
// (c) 2018 Prof Dr Andreas Müller, Hochschule Rapperswil
//
#include "colors.inc"

#declare o = -1;
#declare skalierung = 1;

camera {
	location <2.8 * o, 1.25, -2>
	look_at <0 * o, -0.17, 0>
	right x * skalierung
	up y * skalierung
}

#declare boxcolor = rgbf<0.9,0.9,1,0.7>;
#declare wand = 0.1;

#include "common.inc"

#declare at = 0.05;
#declare l = 1.3;

union {
	cylinder { <-l * o, 0, 0>, <l * o, 0, 0>, at }
	cone {     < l * o, 0, 0>, 2 * at, <(l + 4 * at) * o, 0, 0>, 0 }
	cylinder { <0 * o, -l, 0>, <0 * o, l, 0>, at }
	cone {     <0 * o,  l, 0>, 2 * at, <0 * o, l + 4 * at, 0>, 0 }
	cylinder { <0 * o, 0, -l>, <0 * o, 0, l>, at }
	cone {     <0 * o, 0,  l>, 2 * at, <0 * o, 0, l + 4 * at>, 0 }
	
	pigment {
		color Yellow
	}
	finish {
		specular 0.2
		metallic
	}
}

