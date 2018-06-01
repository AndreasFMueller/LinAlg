//
// ebene.pov 
//
// (c) 2018 Prof Dr Andreas Müller, Hochschule Rapperswil
//
#include "colors.inc"

#declare skalierung = 0.48;

#declare A = <10, -7, 5>;
#declare B = <1, -7, 2>;
#declare P = <5, 5, 5>;
#declare O = <0, 0, 0>;
#declare S = 0.5 * (A + B);
#declare N = B - A;
#declare r = <3,2,-1>;
#declare p0 = <2,3,6>;

#declare w = 0.59;

camera {
	location <12, 15, -35>
	look_at w * S + (1 - w) * P
	right x * skalierung
	up y * skalierung
}

sky_sphere {
	pigment {
		color <1,1,1>
	}
}

light_source {
	<-80,50,-30>, color White
	area_light <0,0,10> <0,10,0>, 10, 10
        adaptive 1
        jitter
}

#declare arrowthickness = 0.18;

#macro arrow(from, to, r, farbe)
	union {
		#declare arrowlength = vlength(to - from);
		#declare arrowdirection = vnormalize(to - from);
		cylinder {
			from,
			to - 5 * r * arrowdirection,
			r
		}
		cone {
			to - 5 * r * arrowdirection,
			2 * r,
			to,
			0
		}
		pigment {
			color farbe
		}
		finish {
			specular 0.2
			metallic
		}
	}
#end

#declare ex = <1,0,0>;
#declare ey = <0,0,1>;
#declare ez = <0,1,0>;

arrow(-ex, 15 * ex, arrowthickness, White)
arrow(-ey, 12 * ey, arrowthickness, White)
arrow(-10 * ez, 8 * ez, arrowthickness, White)

#macro punkt(p, farbe, r)
	sphere {
		p, r
		pigment {
			color farbe
		}
		finish {
			specular 0.2
			metallic
		}
	}
#end

punkt(A, Red, 2 * arrowthickness)
punkt(B, Red, 2 * arrowthickness)
punkt(S, Yellow, 2 * arrowthickness)
punkt(P, Blue, 2 * arrowthickness)
//punkt(O, White)

#macro strecke(from, to, farbe)
	cylinder {
		from, to, arrowthickness
		pigment {
			color farbe
		}
		finish {
			specular 0.2
			metallic
		}
	}
#end

strecke(A, P, rgb<0,0.8,0.6>)
strecke(B, P, rgb<0,0.8,0.6>)

intersection {
	cylinder {
		A + 3 * N, B - 3 * N, arrowthickness
	}
	box {
		<-3,-9,-3>, <14,7,10>
	}
	pigment {
		color rgb<1,0.6,0>
	}
	finish {
		specular 0.2
		metallic
	}
}

intersection {
	union {
		cylinder { p0 + 10 * r, p0 - 10 * r, arrowthickness }
		sphere { p0, 2 * arrowthickness }
	}
	box {
		<-3,-9,-3>, <14,7,10>
	}
	pigment {
		color rgb<0.2,0.6,1>
	}
	finish {
		specular 0.2
		metallic
	}
}
arrow(p0, p0 + r, 1.3 * arrowthickness, rgb<0.2,0.6,1>)

intersection {
	#declare n = vnormalize(N);
	difference {
		plane { n, vdot(n, S) + 0.01 }
		plane { n, vdot(n, S) - 0.01 }
	}
	box {
		<-3,-9,-3>, <14,7,10>
	}
	pigment {
		color rgbf<0.8,0.8,1,0.6>
	}
	finish {
		specular 0.2
		metallic
	}
}




