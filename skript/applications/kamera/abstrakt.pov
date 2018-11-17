//
// abstrakt.pov
//
// (c) 2018 Prof Dr Andreas Müller, Hochschule Rapperswil
//
#version 3.7;
#include "colors.inc"
#include "../../0-common/common.inc"

global_settings {
	assumed_gamma 1
}

#declare imagescale = 0.22;

#declare C = <0, 0, 0>;

#declare M = <1, 0, 0>;
#declare A = <0, 0, 0.48>;
#declare B = <0, 0.36, 0>;

#declare treecolor = rgb<0, 0.6, 0>;
#declare boxcolor = rgb<0, 0.4, 0.8>;
#declare beamcolor = rgb<1,0.8,0.2>;

#declare at = 0.04;
#declare o = 0.5;

camera {
        location <8, 3.5, -8>
        look_at <1.5, 0, 0>
        right 16/9 * x * imagescale
        up y * imagescale
}

light_source {
        <9, 7, -3> color White
        area_light <0.1,0,0> <0,0,0.1>, 10, 10
        adaptive 1
        jitter
}

sky_sphere {
        pigment {
                color rgb<1,1,1>
        }
}

sphere {
	C, 1.3 * at
	pigment {
		color Red
	}
}

box {
	<3,-0.4,-0.6>, <3.4, 0.1, 0.2>
	pigment {
		color boxcolor
	}
}

box {
	0.99 * M - A - B, 1.01 * M + A + B
	pigment {
		color rgbf<0.9, 0.9, 1, 0.3>
	}
}

box {
	-0.99 * M - A - B, -1.01 * M + A + B
	pigment {
		color rgbf<0.9, 0.9, 1, 0.3>
	}
}

union {
	cylinder { <3, 0, 0+o>, <3, 0.25, 0+o>, 0.1 }
	cone { <3, 0.2, 0+o>, 0.25, <3, 1, 0+o> 0 }
	pigment {
		color treecolor
	}
}

union {
	cylinder { <-1, 0, 0>, <4, 0, 0>, 0.5 * at }
	sphere { <-1, 0, 0>, 0.5 * at }
	sphere { <4, 0, 0>, 0.5 * at }
	pigment {
		color White
	}
	finish {
		specular 0.9
		metallic
	}
}

#declare s = 1/3;

#macro tree()
	prism {
		linear_sweep
		linear_spline
		0.989, 1.011,
		7,
		s*<o+0.1, 0>,
		s*<o+0.1,0.2>,
		s*<o+0.28,0.2>,
		s*<o+0,1>,
		s*<o-0.28,0.2>,
		s*<o-0.1, 0.2>,
		s*<o-0.1, 0>
		pigment {
			color treecolor
		}
		rotate <-90, 0, 0>
		rotate <0, -90, 0>
	}
#end

#macro rectangle()
	prism {
		linear_sweep
		linear_spline
		0.989, 1.011,
		4,
		s*<0.2, 0.1>, s*<-0.6, 0.1>, s*<-0.6, -0.4>, s * <0.2, -0.4>
		pigment {
			color boxcolor
		}
		rotate <-90, 0, 0>
		rotate <0, -90, 0>
	}
#end

	tree()
	rectangle()

object {
	tree()
	matrix<
		-1, 0, 0,
		0, -1, 0,
		0, 0, -1,
		0, 0, 0
	>
}

object {
	rectangle()
	matrix<
		-1, 0, 0,
		0, -1, 0,
		0, 0, -1,
		0, 0, 0
	>
}

#macro beam(from, to)
union {
	cylinder { from, to, 0.2 * at }
	sphere { from, 0.2 * at }
	sphere { to, 0.2 * at }
	no_shadow
	pigment {
		color beamcolor
	}
}
#end

beam(<3, 0, o>, <-1, 0, -s * o>)
beam(<3, 1, o>, <-1, -s*1, -s*o>)
beam(<3, 0.1, 0.2>, <-1, -s*0.1, -s * 0.2>)
beam(<3, 0.1, -0.6>, <-1, -s*0.1, s * 0.6>)
beam(<3, -0.4, 0.2>, <-1, s * 0.4, -s * 0.2>)
beam(<3, -0.4, -0.6>, <-1, s * 0.4, s * 0.6>)

