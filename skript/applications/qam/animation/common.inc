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

camera {
        location <-30, 10, -20>
        look_at <0, 0.1, -3.75>
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

//sky_sphere {
//	pigment {
//		color rgb<1,1,1>
//	}
//}

background {
	color srgbt<0,0,0,1>
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

arrow( < -2.2, 0  , 0>, < 2.2, 0  ,  0>, 0.02, White)
arrow( <  0,  -2.2, 0>, < 0  , 2.2,  0>, 0.02, White)
arrow( <  0,   0  , 0>, < 0  , 0  , -8>, 0.02, White)

//
// slew function used for animations
//
#declare stufe = function(s) { (abs(s-0.1)/(0.8)+abs(s-0.9)/(-0.8)+1)/2 }
#declare slew = function(s) { (1 - cos(stufe(s) * pi)) / 2 }
