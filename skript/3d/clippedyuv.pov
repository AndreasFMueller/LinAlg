#version 3.7;

global_settings { assumed_gamma 1.0 }
global_settings { ambient_light rgb 0.5*<1,1,1> }

#include "colors.inc"
#include "cube.inc"
#include "uvvectors.inc"

#declare scalefactor = 0.4;

camera {
	location <3, 2, 4>
	look_at <0.5, 0.5, 0.5>
	right 4/3 * x * scalefactor
	up y * scalefactor
}

light_source {
	<6, 8, 3>
	color 1 * White
	area_light <0.2, 0, 0>, <0, 0, 0.4>, 10, 10
	adaptive 1
	jitter 
}
light_source {
	<6, 8, 3>
	color 1 * White
	area_light <0.4, 0, 0>, <0, 0, 0.2>, 10, 10
	adaptive 1
	jitter 
}
sky_sphere {
	pigment {
		color <1,1,1>
	}
}

#declare normalvector = <0.44724, 0.87801, 0.17052>;

#declare maxl = vdot(<1,1,1>, normalvector);
#declare l = maxl * pow(sin(3.1415 * zeit), 2);

clippedcube( plane { normalvector, l } )
uvvectors(l / (normalvector.x + normalvector.y + normalvector.z) )

#include "rgbaxes.inc"
