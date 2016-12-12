//
// yuvbox.inc
//
// (c) 2016 Prof Dr Andreas Müller, Hochschule Rapperswil
//

box { <0, -0.5, -0.5>, <1, 0.5, 0.5>
	matrix <1,        1,          1,
		0,       -0.39465,    2.03211,
                1.13983, -0.58060,    0,
                0,        0,          0>
	pigment { rgb 0.7 * <1, 1, 1, 1> }
}

#declare uvector = 0.55 * <0, -0.39465, 2.03211>;
#declare vvector = 0.55 * <1.13983, -0.58060, 0>;

#declare yuvaxisthickness = 0.02;

sphere { <0, 0, 0>, yuvaxisthickness * 2
	pigment { rgb <1, 1, 1> }
}

#macro yuvaxis(from, to, col)
	cylinder { from, to, yuvaxisthickness
		pigment { rgb col }
	}
	cone {
		to, 2 * yuvaxisthickness,
		(vlength(to) + 5 * yuvaxisthickness) * vnormalize(to), 0
		pigment { rgb col }
	}
	sphere { from, yuvaxisthickness
		pigment { rgb col }
	}
#end

yuvaxis(-uvector, uvector, <0,0,1>)
yuvaxis(-vvector, vvector, <1,0,0>)
yuvaxis(<0,0,0>, 1.1 * <1,1,1>, <1,1,1>)

text {
	ttf "timrom.ttf" "U" 0.1, 0
	pigment { rgb <0, 0, 1> }
	scale 0.2
	translate <-0.08, -0.07, -0.02>
	matrix <
		-0.89442,  0.43903,  0.08526,
		 0.00000,  0.19065, -0.98166,
		-0.44724, -0.87801, -0.17052,
		 0.00000,  0.00000,  0.00000
	>
	translate 1.2 * uvector
}
text {
	ttf "timrom.ttf" "V" 0.1, 0
	pigment { rgb <1, 0, 0> }
	scale 0.2
	translate <-0.08, -0.10,  0>
	matrix <
		-0.07739, -0.15194,  0.98535,
		-0.89106,  0.45388, -0.00000,
		 0.44724,  0.87801,  0.17052,
		 0.00000,  0.00000,  0.00000
	>
	translate 1.2 * vvector
}
text {
	ttf "timrom.ttf" "Y" 0.1, 0
	pigment { rgb 0.5 * White }
	scale 0.2
	translate <-0.08, -0.07, 0>
	matrix <
		-0.70711, -0.00000,  0.70711,
		-0.40825,  0.81650, -0.40825,
		-0.57735, -0.57735, -0.57735,
//		-0.40825, -0.40825,  0.81650,
//		-0.70711,  0.70711, -0.00000,
//		-0.57735, -0.57735, -0.57735,
		 0.00000,  0.00000,  0.00000
	>
	translate <1.2, 1.2, 1.2>
}


