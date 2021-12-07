#include "colors.inc"
#include "textures.inc"
#include "finish.inc"

#declare A = <1,9,2>;
#declare B = <5,1,5>;
#declare r1 = B - A;
#declare C = <3,0,0>;
#declare D = <9,4,10>;
#declare r2 = D - C;
#declare E = <4,3,0>;
#declare F = <2,7,10>;
#declare rechts = vnormalize(vcross(r2, r1));
#declare oben = vnormalize(vcross(r2, rechts));


#declare r = 0.25;
#declare R = 5 * r;

light_source {
	<2, 10, -4> color White
}

sky_sphere {
	pigment {
		color <1, 1, 1>
	}
}

#macro rohr(a, b, c)
	difference {
		cylinder { a, b, 0.5 }
		cylinder { a + (a - b), b + (b - a), 0.499999 }
		pigment {
			color c
		}
		finish {
			metallic
			specular 0.9
		}
	}
#end

union {
	union {
		cylinder { <0,0,0>, <11 - R,0,0>, r }
		cone { <11 - R,0,0>, 2*r, <11, 0, 0>, 0 }
		pigment { color rgb <0.7,0,0> }
	}
	union {
		cylinder { <0,0,0>, <0,0,11 - R>, r }
		cone { <0,0,11 - R>, 2*r, <0, 0, 11>, 0 }
		pigment { color rgb <0,1,0> }
	}
	union {
		cylinder { <0,0,0>, <0,11 - R ,0>, r }
		cone { <0,11 - R,0>, 2*r, <0, 11, 0>, 0 }
		pigment { color rgb <0,0,1> }
	}
	sphere {
		<0,0,0>, 1.5 * r
		pigment { color rgb <1,1,1> }
	}
}

rohr(A, B, rgb<0.4,0.2,0.0>)
rohr(C, D, rgb<1.0,1.0,1.0,0.1>)

//rohr(E, F, rgb<1.3,1.3,1.3,0.1>)

