//
// common.inc
//
// (c) 2021 Prof Dr Andreas Müller OST Ostschweizer Fachhochschule
//
#version 3.7;
#include "colors.inc"
#include "textures.inc"

#declare imagescale = 1.15;
#declare planecolor = rgb<0.6,0.8,1.0>;
#declare do_transform2 = 0;
#declare do_transform3 = 0;

global_settings {
	assumed_gamma 1
}

//
// draw an arrow from <from> to <to> with thickness <arrowthickness> with
// color <c>
//
#macro arrow(from, to, arrowthickness, c)
	#declare arrowdirection = vnormalize(to - from);
	#declare arrowlength = vlength(to - from);
	union {
		sphere {
			from, 1.1 * arrowthickness
		}
		cylinder {
			from,
			from + (arrowlength - 5 * arrowthickness) * arrowdirection,
			arrowthickness
		}
		cone {
			from + (arrowlength - 5 * arrowthickness) * arrowdirection,
			2 * arrowthickness,
			to,
			0
		}
		pigment {
			color c
		}
		finish {
			specular 0.9
			metallic
		}
	}
#end

#declare l = 180;

arrow(<-l*1.9,0,0>, <l,0,0>, 3, Red)
arrow(<0,-l,0>, <0,l,0>, 3, rgb<0.2,0.2,1>)
arrow(<0,0,-l>, <0,0,l>, 3, rgb<0,0.5,0>)

camera {
	location <300,100,100>
	look_at <-10,10,0>
	right 16/9 * x * imagescale
	up y * imagescale
}

light_source {
        <400,150,200> color White
        area_light <40,0,0> <0,0,40>, 10, 10
        adaptive 1
        jitter
}

sky_sphere {
        pigment {
                color White
        }
}

