//
// devil-rotated.pov
//
// (c) 2020 Prof Dr Andreas Müller, Hochschule Rapperswil
//
#version 3.7;

#declare do_transform = 1;
#include "devil-common.inc"

#declare s = 0.04;

union {
	sphere { s*<1,1,1>, 0.004 }
	sphere { s*<1,0,1>, 0.001 }
	cylinder { s*<1,0,0>, s*<1,0,1>, 0.001 }
	cylinder { s*<0,0,1>, s*<1,0,1>, 0.001 }
	cylinder { s*<1,0,1>, s*<1,1,1>, 0.001 }
	cylinder { <0,0,0>, s*<1,1,1>, 0.001 }
	sphere { s*<1,1,-2>, 0.004 }
	sphere { s*<1,0,-2>, 0.001 }
	cylinder { s*<1,0,0>, s*<1,0,-2>, 0.001 }
	cylinder { s*<0,0,-2>, s*<1,0,-2>, 0.001 }
	cylinder { s*<1,0,-2>, s*<1,1,-2>, 0.001 }
	cylinder { <0,0,0>, s*<1,1,-2>, 0.001 }
	sphere { s*<1,1,-2>, 0.004 }
	pigment {
		color Orange
	}
	finish{
		specular 0.96
		metallic
	}
}

