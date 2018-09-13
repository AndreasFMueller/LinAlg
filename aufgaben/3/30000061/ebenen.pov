//
// ebenen.pov
//
// (c) 2018 Prof Dr Andreas Müller, Hochschule Rapperswil
//
#version 3.7;
#include "colors.inc"

global_settings {
	assumed_gamma 1
}

#declare imagescale = 2;

camera {
	location <10, 10, -10>
	look_at <0, 5, 0>
	right 16/9 * x * imagescale
	up y * imagescale
}

light_source {
	<-100, 100, 0> color White
	area_light <1,0,0> <0,0,1>, 10, 10
	adaptive 1
	jitter
}

sky_sphere {
	pigment {
		color <1,1,1>
	}
}

#declare arrowthickness = 0.1;

#macro arrow(from, to, c)
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

#declare A = <-1, -2, -3>;
#declare B = < 1,  1,  2>;
#declare C = <-2,  3, -4>;
#declare D = < 0,  0, -3>;
#declare E = <12,  9,  1>;
#declare F = < 9, 13, -9>;

#declare n = vnormalize(<18, 8, -12>);

arrow(<-4,  0,   0>, <14,  0, 0>, rgb<102/255, 102/255, 1>)
arrow(< 0,  0, -10>, < 0,  0, 3>, rgb<102/255, 102/255, 1>)
arrow(< 0, -3,   0>, < 0, 15, 0>, rgb<102/255, 102/255, 1>)

arrow(A, B, rgb<204/255, 0, 0>)
arrow(C, D, rgb<0, 102/255, 0>)

arrow(E, E+B-A, rgb<204/255, 0, 0>)
arrow(E, E+D-C, rgb<0, 102/255, 0>)

arrow(E, E+4*n, rgb<0, 204/255, 0>)

plane {
	n, vdot(n, E)
	pigment {
		color rgbt<0.8,0.6,0.6,0.8>
	}
}

sphere { A, 0.2
}
sphere { B, 0.2
}
sphere { C, 0.2
}
sphere { D, 0.2
}
sphere { E, 0.2
}
sphere { F, 0.2
}


