//
// wtf.pov
//
// (c) 2020 Prof Dr Andreas Müller, Hochschule Rapperswil
//
#version 3.7;
#include "colors.inc"
#include "textures.inc"

global_settings {
	assumed_gamma 1
}

#declare imagescale = 0.064;

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
			specular 0.98
			metallic
		}
	}
#end

#declare l = 0.14;
arrow(<0,0,0>, <l,0,0>,0.003, Red)
arrow(<0,0,0>, <0,l,0>,0.003, rgb<0.2,0.2,1>)
arrow(<0,0,0>, <0,0,l>,0.003, rgb<0,0.5,0>)

object {
#include "wtf.inc"
	pigment {
		color rgb<0.824,0.631,0.549>
	}
//	finish {
//		specular 0.95
//		metallic
//	}
	translate -center_of_mass
	rotate <90,0,0>
#if (do_transform > 0)
	matrix<
	   0.90453,  0.30151,  0.30151,
	  -0.40825,  0.81650,  0.40825,
	  -0.12309, -0.49237,  0.86164,
	   0.00000,  0.00000,  0.00000>
#end
}

camera {
	location <1.7,1.1,2.3>
	look_at <0.019,0.044,0>
	right 16/9 * x * imagescale
	up y * imagescale
}

light_source {
	<4,1.5,2> color White
	area_light <0.4,0,0> <0,0,0.4>, 10, 10
	adaptive 1
	jitter
}

sky_sphere {
	pigment {
		color White
	}
}

