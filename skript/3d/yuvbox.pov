#version 3.7;

global_settings { assumed_gamma 1.0 }

#include "colors.inc"
#include "cube.inc"

#declare scalefactor = 0.33;

camera {
	location <8 * cos(zeit * 2 * 3.1415) + 0.5, 2, 8 * sin(zeit * 2 * 3.1415) + 0.5>
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

clippedcube( box { <-1,-1,-1>, <2,2,2> } )

#include "rgbaxes.inc"
#include "yuvbox.inc"
