//
// tetraeder.pov 
//
// (c) 2018 Prof Dr Andreas Müller, Hochschule Rapperswil
//
#include "colors.inc"

#declare skalierung = 0.79;

camera {
	location <0.7, 1.25, -4>
	look_at <-0.09, -0.09, 0>
	right x * skalierung
	up y * skalierung
}

sky_sphere {
	pigment {
		color <1,1,1>
	}
}

light_source {
	<-8,10,-7>, color White
}

#declare A = <1,1,1>;
#declare B = <-1,1,-1>;
#declare C = <1,-1,-1>;
#declare D = <-1,-1,1>;

#declare at = 0.02;
#declare l = 1.4;

union {
	cylinder { <-l, 0, 0>, <l, 0, 0>, at }
	cone {     < l, 0, 0>, 2 * at, <l + 4 * at, 0, 0>, 0 }
	cylinder { <0, -l, 0>, <0, l, 0>, at }
	cone {     <0,  l, 0>, 2 * at, <0, l + 4 * at, 0>, 0 }
	cylinder { <0, 0, -l>, <0, 0, l>, at }
	cone {     <0, 0,  l>, 2 * at, <0, 0, l + 4 * at>, 0 }
	
	pigment {
		color Yellow
	}
	finish {
		specular 0.2
		metallic
	}
}

union {
	sphere { A, 0.1 }
	sphere { B, 0.1 }
	sphere { C, 0.1 }
	sphere { D, 0.1 }
	mesh {
		triangle { A, B, C }
		triangle { A, B, D }
		triangle { A, C, D }
		triangle { B, C, D }
	}
	pigment {
		color rgb<0.7,0.7,0.7>
	}
	finish {
		specular 0.1
		metallic
	}
}

