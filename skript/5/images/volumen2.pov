//
// volumen2.pov
//
// (c) 2018 Prof Dr Andreas Müller, Hochschule Rapperswil
//
#include "volumen.inc"

mesh {
	triangle { O, B, A }
	triangle { B, A+B, A }
	triangle { O, A, A+C }
	triangle { O, A+C, C }

	pigment {
		color rgb<0.8, 0.8, 1>
	}
}

arrow(O, B, at, Blue)
arrow(O, C, at, Blue)
arrow(O, A, at, Blue)
