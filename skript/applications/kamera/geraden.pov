//
// geraden.pov -- Abbildung von Geraden durch eine Lochkamera
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
#declare p0 = <2,-1,-1>;
#declare r = <0.5,0.6,0.8>;

#declare beamcolor = rgb<1,0.8,0.2>;
#declare geradecolor = rgb<0, 0.4, 0.8>;

#declare at = 0.04;
#declare o = 0.5;
#declare s = 1/3;

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

// Zentrum
sphere {
	C, 1.3 * at
	pigment {
		color Red
	}
}

// Abbildungsebenen
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

// Achse
union {
	cylinder { <0, -10, 0>, <0, 10, 0>, 0.5 * at }
	cylinder { <0, 0, -10>, <0, 0, 10>, 0.5 * at }
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

// Strahl
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

#macro bild(p)
	((-1) * <1, p.y/p.x, p.z/p.x>)
#end

#macro bilds(p)
	<1, p.y/p.x, p.z/p.x>
#end

//beam(<3, -0.4, -0.6>, <-1, s * 0.4, s * 0.6>)

#macro gerade(s)
	(p0 + (s) * r)
#end

#macro bildgerade(s)
	bild(gerade(s))
#end

#macro bildsgerade(s)
	bilds(gerade(s))
#end

#declare s = 0.5;
#while (s < 3.5)
	#declare P = gerade(s);
	beam(P, bild(P))
	#declare s = s + 0.1;
#end

#declare n = -vcross(gerade(0), gerade(1));
#declare E1 = <1, 0, 0>;
#declare E2 = <0, 0, 1>;

// arrow(C, n, at, Green)

#declare a0 = vnormalize(n);
#declare a1 = E1 - vdot(a0, E1) * a0;
#declare a1 = vnormalize(a1);
#declare a2 = E2 - vdot(E2, a0) * a0 - vdot(E2, a1) * a1;
#declare a2 = vnormalize(a2);

#macro punkt(q, r)
	q * (a1 + 0.1 * a2) + r * a2
#end

#declare P1 = punkt(-1.2, -1);
#declare P2 = punkt( 3.5, -1);
#declare P3 = punkt( 3.5,  1);
#declare P4 = punkt(-1.2,  1);

mesh {
	triangle { P1, P2, P3 }
	triangle { P1, P3, P4 }
	pigment {
		color rgbf<0.8,0.8,1,0.5>
	}
}

cylinder { gerade(-10), gerade(10), 0.5*at
	pigment {
		color geradecolor
	}
}

intersection {
	cylinder { bild(gerade(-2)), bild(gerade(20)), 0.5*at }
	box { -0.9 * M - A - B, -1.1 * M + A + B }
	pigment {
		color geradecolor
	}
}

intersection {
	cylinder { bildsgerade(-2), bildsgerade(30), 0.5*at }
	box { 0.9 * M - A - B, 1.1 * M + A + B }
	pigment {
		color geradecolor
	}
}
