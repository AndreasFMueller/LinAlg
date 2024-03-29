//
// devil-common.inc 
//
// (c) 2020 Prof Dr Andreas Müller, Hochschule Rapperswil
//
#version 3.7;
#include "colors.inc"
#include "textures.inc"

global_settings {
	assumed_gamma 1
}

#declare imagescale = 0.066;

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

#declare l = 0.14;
arrow(<0,0,0>, <l,0,0>,0.003, Red)
arrow(<0,0,0>, <0,l,0>,0.003, rgb<0.2,0.2,1>)
arrow(<0,0,0>, <0,0,l>,0.003, rgb<0,0.5,0>)

cylinder { <0,0,0>, <-1, 0, 0>, 0.001
	pigment {
		color Red
	}
	finish {
		specular 0.9
		metallic
	}
}
cylinder { <0,0,0>, <0, -1, 0>, 0.001
	pigment {
		color rgb<0.2,0.2,1>
	}
	finish {
		specular 0.9
		metallic
	}
}
cylinder { <0,0,0>, <0, 0, -1>, 0.001
	pigment {
		color rgb<0,0.5,0>
	}
	finish {
		specular 0.9
		metallic
	}
}

object {
#include "devil.inc"
	pigment {
		color rgb<0.824,0.631,0.549>
	}
//	finish {
//		specular 0.95
//		metallic
//	}
	translate -center_of_mass
	rotate <180,0,90>
#if (do_transform > 0)
	matrix<
	   0.70711,  -0.70711,  0.00000,
	   0.40825,   0.40825, -0.81650,
	   0.57735,   0.57735,  0.57735,
	   0.00000,   0.00000,  0.00000 >
#end
}

camera {
	location <2,1,2>
	look_at <0,0.04,0>
	right 16/9 * x * imagescale
	up y * imagescale
}

//#declare light_location = <-8, 8, -6>;

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

