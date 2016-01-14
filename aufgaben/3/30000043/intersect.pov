#include "colors.inc"
#include "textures.inc"
#include "finish.inc"

#declare r = 0.25;
#declare R = 5 * r;
#declare s = 1.4;

camera {
	location <3,0,0> + s * <6,4,10> - 0.55 * (1 / sqrt(136)) * <10,0,-6>
	look_at <3,0,0> - 0.5 * (1 / sqrt(136)) * <10,0,-6> + <0,1.7,0>
	right x * 0.45
	up y * 0.45
}

light_source {
	<2, 10,  4> color White
}

sky_sphere {
	pigment {
		color <1, 1, 1>
	}
}

union {
	union {
		cylinder { <0,0,0>, <11 - R,0,0>, r }
		cone { <11 - R,0,0>, 2*r, <11, 0, 0>, 0 }
		pigment { color rgb <1.4,0,0> }
	}
	union {
		cylinder { <0,0,0>, <0,0,11 - R>, r }
		cone { <0,0,11 - R>, 2*r, <0, 0, 11>, 0 }
		pigment { color rgb <0,3,0> }
	}
	union {
		cylinder { <0,0,0>, <0,11 - R ,0>, r }
		cone { <0,11 - R,0>, 2*r, <0, 11, 0>, 0 }
		pigment { color rgb <0,0,3> }
	}
	sphere {
		<0,0,0>, 1.5 * r
		pigment { color rgb <1,1,1> }
	}
}

cylinder {
	<1,9,2>, <5,1,5>, 0.5
	pigment {
		color rgb<1.3,1.3,0.3>
	}
}

cylinder {
	<3,0,0>, <9,4,10>, 0.5
	pigment {
		color rgb<1.3,1.3,1.3>
	}
}

cylinder {
	<4,3,0>, <2,7,10>, 0.5 
	pigment {
		color rgb<1.3,1.3,1.3>
	}
}
