//
// volumen1.pov
//
// (c) 2018 Prof Dr Andreas Müller, Hochschule Rapperswil
//
#include "volumen.inc"

mesh {
	triangle { O, B, A1 }
	triangle { B, A1+B, A1 }
	triangle { O, A1, A1+C }
	triangle { O, A1+C, C }

	triangle { A1, A1+B, A }
	triangle { A1+B, A+B, A }
	triangle { A1, A, A+C }
	triangle { A1, A+C, A1+C }
	triangle { A, A+B, A+B+C }
	triangle { A, A+B+C, A+C }

	pigment {
		color rgb<0.8, 0.8, 1>
	}
}

arrow(O, B, at, Blue)
arrow(O, C, at, Blue)
arrow(O, A1, at, Blue)
arrow(A1,A1+B, at, Blue)
arrow(A1,A1+C, at, Blue)
arrow(A1,A1+A2, at, Blue)
