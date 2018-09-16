//
// oktaeder.pov 
//
// (c) 2018 Prof Dr Andreas Müller, Hochschule Rapperswil
//
#include "colors.inc"

#declare skalierung = 0.63;

camera {
	location <2.3, 1.9, -3>
	look_at <0.1, 0.22, 0.1>
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

#declare A = <0,1,0>;
#declare B = <1,0,0>;
#declare C = <0,0,1>;
#declare D = <-1,0,0>;
#declare E = <0,0,-1>;
#declare F = <0,-1,0>;

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
	sphere { A, 0.05 }
	sphere { B, 0.05 }
	sphere { C, 0.05 }
	sphere { D, 0.05 }
	sphere { E, 0.05 }
	sphere { F, 0.05 }
	mesh {
		triangle { A, B, C }
		triangle { A, C, D }
		triangle { A, D, E }
		triangle { A, E, B }
		triangle { B, C, F }
		triangle { C, D, F }
		triangle { D, E, F }
		triangle { E, B, F }
	}
	pigment {
		color rgb<0.7,0.7,0.7>
	}
	finish {
		specular 0.1
		metallic
	}
}

