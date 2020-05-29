//
// common.inc -- some common useful tools for drawing 3d images
//
// (c) 2020 Prof Dr Andreas Müller, Hochschule Rapperswil
//
#include "colors.inc"

global_settings {
        assumed_gamma 1
}

#declare imagescale = 0.14;
#declare axisdiameter = 0.02;

#declare toplookat = <0,0,-4>;
#declare perspectivelookat = <0, 0.1, -4.0>;

#declare toplocation = <-0.1,33,-4>;
#declare perspectivelocation = <-30, 10, -20>;

camera {
        location (viewpoint * toplocation + (1 - viewpoint) * perspectivelocation) * (1 + 1 * viewpoint * (1 - viewpoint))
        look_at viewpoint * toplookat  + (1 - viewpoint) * perspectivelookat
        right 16/9 * x * imagescale
        up y * imagescale
}

#declare lightposition = <-10, +10, -20>;
#declare lightdir1 = vnormalize(vcross(lightposition, <0,1,0>));
#declare lightdir2 = vnormalize(vcross(lightposition, lightdir1));

light_source {
        lightposition color White
        area_light lightdir1 lightdir2, 10, 10
        adaptive 1
        jitter
}

sky_sphere {
	pigment {
		color rgb<1,1,1>
	}
}

//background {
//	color srgbt<0,0,0,1>
//}

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

arrow( < -2.2, 0  , 0>, < 2.2, 0  ,  0>, 0.02, White)
arrow( <  0,  -2.2, 0>, < 0  , 2.2,  0>, 0.02, White)
arrow( <  0,   0  , 0>, < 0  , 0  , -8>, 0.02, White)

#declare letterthickness = 0.1;

text {
	internal 1 "t"
	letterthickness, <0, 0, 0>
	pigment {
		color rgb<0.8,0,0>
	}
	finish {
		specular 0.9
		metallic
	}
	scale 0.5
	rotate <0, 90, 0>
	rotate <0, 0, -90>
	translate <0.1, letterthickness/2, -7.9>
}

text {
	internal 1 "I"
	letterthickness, <0, 0, 0>
	pigment {
		color rgb<0.8,0,0>
	}
	finish {
		specular 0.9
		metallic
	}
	scale 0.5
	rotate <0, 90 * viewpoint, 0>
	rotate <0, 0, -90 * viewpoint>
	translate <1.9, letterthickness/2, -0.12> * viewpoint + <2.0, 0.1, -letterthickness/2> * (1 - viewpoint)
}

text {
	internal 1 "Q"
	letterthickness, <0, 0, 0>
	pigment {
		color rgb<0.8,0,0>
	}
	finish {
		specular 0.9
		metallic
	}
	scale 0.5
	translate <-0.6,1.9,-letterthickness/2>
}
