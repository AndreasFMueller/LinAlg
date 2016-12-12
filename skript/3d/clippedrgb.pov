#version 3.7;

global_settings { assumed_gamma 1.0 }

#include "colors.inc"
#include "cube.inc"

#declare scalefactor = 0.4;

camera {
	location <3, 2, 4>
	look_at <0.5, 0.5, 0.5>
	right 4/3 * x * scalefactor
	up y * scalefactor
}

light_source { <6, 8, 3> color 2 * White }
sky_sphere {
	pigment {
		color <1,1,1>
	}
}

clippedcube( plane { <1,1,1>, pow(sin(3.1415 * zeit),2) * sqrt(3) } )

#include "rgbaxes.inc"
