//
// oktaeder.pov 
//
// (c) 2018 Prof Dr Andreas Müller, Hochschule Rapperswil
//
#include "colors.inc"

#declare skalierung = 0.59;

camera {
	location <3.3, 1.2, -6>
	look_at <0.14, 0.155, 0.0>
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

#declare phi = (1 + sqrt(5))/2;

// orange
#declare A01 = <      1,      1,      1 >;
#declare A02 = <      1,      1,     -1 >;
#declare A03 = <      1,     -1,      1 >;
#declare A04 = <      1,     -1,     -1 >;
#declare A05 = <     -1,      1,      1 >;
#declare A06 = <     -1,      1,     -1 >;
#declare A07 = <     -1,     -1,      1 >;
#declare A08 = <     -1,     -1,     -1 >;
// green
#declare A09 = <      0,  1/phi,    phi >;
#declare A10 = <      0,  1/phi,   -phi >;
#declare A11 = <      0, -1/phi,    phi >;
#declare A12 = <      0, -1/phi,   -phi >;
// blue
#declare A13 = <  1/phi,    phi,      0 >;
#declare A14 = <  1/phi,   -phi,      0 >;
#declare A15 = < -1/phi,    phi,      0 >;
#declare A16 = < -1/phi,   -phi,      0 >;
// red
#declare A17 = <    phi,      0,  1/phi >;
#declare A18 = <    phi,      0, -1/phi >;
#declare A19 = <   -phi,      0,  1/phi >;
#declare A20 = <   -phi,      0, -1/phi >;

#macro pentagon(A, B, C, D, E)
	triangle { A, B, C }
	triangle { A, C, D }
	triangle { A, D, E }
#end

#declare at = 0.03;
#declare l = 2.0;

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
	sphere { A01, 0.05 }
	sphere { A02, 0.05 }
	sphere { A03, 0.05 }
	sphere { A04, 0.05 }
	sphere { A05, 0.05 }
	sphere { A06, 0.05 }
	sphere { A07, 0.05 }
	sphere { A08, 0.05 }
	pigment {
		color Orange
	}
	finish {
		specular 0.2
		metallic
	}
}
union {
	sphere { A09, 0.05 }
	sphere { A10, 0.05 }
	sphere { A11, 0.05 }
	sphere { A12, 0.05 }
	pigment {
		color Green
	}
	finish {
		specular 0.2
		metallic
	}
}
union {
	sphere { A13, 0.05 }
	sphere { A14, 0.05 }
	sphere { A15, 0.05 }
	sphere { A16, 0.05 }
	pigment {
		color Blue
	}
	finish {
		specular 0.2
		metallic
	}
}
union {
	sphere { A17, 0.05 }
	sphere { A18, 0.05 }
	sphere { A19, 0.05 }
	sphere { A20, 0.05 }
	pigment {
		color Red
	}
	finish {
		specular 0.2
		metallic
	}
}
union {
	mesh {
		pentagon(A01, A13, A02, A18, A17)
		pentagon(A02, A10, A12, A04, A18)
		pentagon(A13, A15, A06, A10, A02)
		pentagon(A06, A20, A08, A12, A10)
		pentagon(A04, A12, A08, A16, A14)
		pentagon(A03, A17, A18, A04, A14)
		pentagon(A01, A09, A05, A15, A13)
		pentagon(A05, A19, A20, A06, A15)
		pentagon(A07, A19, A20, A08, A16)
		pentagon(A03, A11, A07, A16, A04)
		pentagon(A01, A09, A11, A03, A17)
		pentagon(A05, A19, A07, A11, A09)
	}
	pigment {
		color rgbf<0.7,0.7,0.7,0.5>
	}
	finish {
		specular 0.1
		metallic
	}
}

#declare r = 0.02;
union {
	cylinder { A01, A17, r }
	cylinder { A01, A13, r }
	cylinder { A01, A09, r }
	cylinder { A02, A10, r }
	cylinder { A02, A13, r }
	cylinder { A02, A18, r }
	cylinder { A03, A11, r }
	cylinder { A03, A14, r }
	cylinder { A03, A17, r }
	cylinder { A04, A12, r }
	cylinder { A04, A14, r }
	cylinder { A04, A18, r }
	cylinder { A05, A09, r }
	cylinder { A05, A15, r }
	cylinder { A05, A19, r }
	cylinder { A06, A10, r }
	cylinder { A06, A15, r }
	cylinder { A06, A20, r }
	cylinder { A07, A11, r }
	cylinder { A07, A16, r }
	cylinder { A07, A19, r }
	cylinder { A08, A12, r }
	cylinder { A08, A16, r }
	cylinder { A08, A20, r }
//	cylinder { A09, A01, r }
//	cylinder { A09, A05, r }
	cylinder { A09, A11, r }
//	cylinder { A10, A02, r }
//	cylinder { A10, A06, r }
	cylinder { A10, A12, r }
//	cylinder { A11, A03, r }
//	cylinder { A11, A07, r }
//	cylinder { A11, A09, r }
//	cylinder { A12, A08, r }
//	cylinder { A12, A10, r }
//	cylinder { A12, A04, r }
//	cylinder { A13, A01, r }
//	cylinder { A13, A02, r }
	cylinder { A13, A15, r }
//	cylinder { A14, A03, r }
//	cylinder { A14, A04, r }
	cylinder { A14, A16, r }
//	cylinder { A15, A05, r }
//	cylinder { A15, A06, r }
//	cylinder { A15, A13, r }
//	cylinder { A16, A07, r }
//	cylinder { A16, A08, r }
//	cylinder { A16, A14, r }
//	cylinder { A17, A01, r }
//	cylinder { A17, A03, r }
	cylinder { A17, A18, r }
//	cylinder { A18, A02, r }
//	cylinder { A18, A04, r }
//	cylinder { A18, A17, r }
//	cylinder { A19, A05, r }
//	cylinder { A19, A07, r }
	cylinder { A19, A20, r }
//	cylinder { A20, A06, r }
//	cylinder { A20, A08, r }
//	cylinder { A20, A19, r }
	pigment {
		color rgb<0.5,0.5,0.5>
	}
	finish {
		specular 0.2
		metallic
	}
}

