//
// chamber.pov
//
// (c) 2018 Prof Dr Andreas Müller, Hochschule Rapperswil
//
#include "colors.inc"

#declare skalierung = 0.91;

camera {
	location <-1.4, 3, -2>
	look_at <0.08,-0.1, 0>
	right x * skalierung
	up y * skalierung
}

light_source {
	<-3, 0.49, -1.2> color White
}

#declare boxcolor = rgbf<0.9,0.9,1.0,0.0>;
#declare wand = 1;

#include "common.inc"

#declare at = 0.03;
#declare l = 1.3;

union {
	cylinder { < l,  0,  0>,         <     -l,      0,      0>, at }
	cone {     <-l,  0,  0>, 2 * at, <-l-4*at,      0,      0>,  0 }
	cylinder { < 0, -l,  0>,         <      0,      l,      0>, at }
	cone {     < 0,  l,  0>, 2 * at, <      0, l+4*at,      0>,  0 }
	cylinder { < 0,  0, -l>,         <      0,      0,      l>, at }
	cone {     < 0,  0,  l>, 2 * at, <      0,      0, l+4*at>,  0 }
	pigment {
		color Yellow
	}
	finish {
		specular 0.2
		metallic
	}
	no_shadow
}




