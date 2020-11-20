//
// aqr.pov
//
// (c) 2020 Prof Dr Andreas Müller, Hochschule Rapperswil
//

#version 3.7;
#include "colors.inc"
#include "textures.inc"

global_settings {
        assumed_gamma 1
}

#declare imagescale = 0.5;

camera {
	location <7.5, 1.8, 1.0>
	look_at <0, 0, 0>
	right 16/9 * x * imagescale
	up y * imagescale
}

light_source {
	<2, 8, -8> color White
	area_light <0.4,0,0> <0,0,0.4>, 10, 10
	adaptive 1
	jitter
}

sky_sphere {
	pigment {
		color rgb<1,1,1>
	}
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

arrow(<0, 0, 0>, <1.3, 0, 0>, 0.02, rgbt<1,0,0,0.5>)
arrow(<0, 0, 0>, <0, 0, 1.3>, 0.02, rgbt<0,1,0,0.5>)
arrow(<0, 0, 0>, <0, 1.3, 0>, 0.02, rgbt<0,0,1,0.5>)

#if (0)
union {
#declare S = -3;
#while (S <= 3)
	#declare T = -3;
	#while (T <= 3)
		cylinder { <S, T, -3>, <S, T, 3>, 0.01 }
		cylinder { <S, -3, T>, <S, 3, T>, 0.01 }
		cylinder { <-3, S, T>, <3, S, T>, 0.01 }

		#declare T = T + 1;
	#end
	#declare S = S + 1;
#end
	pigment {
		color rgbt<1,1,1,0.5>
	}
	finish {
		specular 0.9
		metallic
	}
}
#end

#include "vectors/0020.inc"

#declare v1 = v_bild1;
#declare v2 = v_bild2;
#declare v3 = v_bild3;

#macro p(U, V, W)
	(U * v1 + V * v2 + W * v3)
#end

arrow(<0,0,0>, p(1.3, 0, 0), 0.02, Red)
arrow(<0,0,0>, p(0, 1.3, 0), 0.02, Green)
arrow(<0,0,0>, p(0, 0, 1.3), 0.02, Blue)

#declare Nmin = 0;
#declare Nmax = 1;

#declare gridradius = 0.015;

union {
#declare S = Nmin;
#while (S <= Nmax)
	#declare T = Nmin;
	#while (T <= Nmax)
		cylinder { p(S, T, Nmin), p(S, T, Nmax), 0.015 }
		cylinder { p(S, Nmin, T), p(S, Nmax, T), 0.015 }
		cylinder { p(Nmin, S, T), p(Nmax, S, T), 0.015 }
		sphere { p(S, T, Nmax), 0.015 }
		sphere { p(S, T, Nmin), 0.015 }
		sphere { p(S, Nmax, T), 0.015 }
		sphere { p(S, Nmin, T), 0.015 }
		sphere { p(Nmax, S, T), 0.015 }
		sphere { p(Nmin, S, T), 0.015 }

		#declare T = T + 1;
	#end
	#declare S = S + 1;
#end
	pigment {
		color Gray
	}
	finish {
		specular 0.9
		metallic
	}
}

#declare n1 = -vnormalize(vcross(v2, v3));
#declare n2 = -vnormalize(vcross(v3, v1));
#declare n3 = -vnormalize(vcross(v1, v2));

#if (0)
arrow(<0,0,0>, n1, 0.03, Red)
arrow(<0,0,0>, n2, 0.03, Green)
arrow(<0,0,0>, n3, 0.03, Blue)
#end

#if (1)
intersection {
	plane { -n1, 0 }
	plane { n1, vdot(n1, v1) }
	plane { -n2, 0 }
	plane { n2, vdot(n2, v2) }
	plane { -n3, 0 }
	plane { n3, vdot(n3, v3) }
	pigment {
		color rgbt<0.5,0.5,0.5,0.5>
	}
	finish {
		specular 0.9
		metallic
	}
}
#end

plane { <0, 1, 0>, 0 
	pigment {
		color rgbt<1,0.8,0.8,0.2>
	}
}
