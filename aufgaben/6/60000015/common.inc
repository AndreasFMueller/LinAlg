//
// common.inc
//
// (c) 2018 Prof Dr Andreas Müller, Hochschule Rapperswil
//

light_source { <5 * o, 8, -5> color White }

sky_sphere {
	pigment {
		color <1,1,1>
	}
}

difference {
	box {
		<-1 * o,-1,-1>, <1 * o,1,1>
	}
	union {
		box { <-0.99 * o,-0.99,-0.99>, <(0.99 + wand) * o,0.99,0.99> }
		cylinder { <-0.5 * o,-0.5,-1.1>, <-0.5 * o,-0.5,-0.9>, 0.05  }
	}
	pigment {
		color boxcolor
	}
}

#declare p1 = < 0.5 * o, -1, -0.5>;
#declare p2 = <-0.5 * o,  1,  0.5>;

cylinder {
	p1 + 0.1 * (p1 - p2),
	p2 + 0.1 * (p2 - p1),
	0.05
	pigment {
		color rgb<0.8,0.2,0.2>
	}
}

#declare p3 = <0.5 * o, 0.2, 1>;

cylinder {
	p3 + <0 * o, 0, 0.001>, p3 - <0 * o, 0, 0.012>, 0.05
	pigment {
		color rgb<0.0,0.6,0.0>
	}
	finish {
		specular 0.2
		metallic
	}
}
