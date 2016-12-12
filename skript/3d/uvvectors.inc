//
// uvvectors.inc -- display the UV vectors
//
// (c) 2016 Prof Dr Andreas Müller, Hochschule Rapperswil
//
#declare uvthickness = 0.02;

#declare uvector = <0, -0.39465, 2.03211>;
#declare vvector = <1.13983, -0.58060, 0>;
#declare uvector0 = vnormalize(uvector);
#declare vvector0 = vnormalize(vvector);
#declare ucolor = uvector + 0.39465;
#declare vcolor = vvector + 0.58060;
#declare ucolor = <0, 0, 1>;
#declare vcolor = <1, 0, 0>;
#declare arrowlength = 0.3;

#macro pfeil(from, to, col)
	#declare	richtung = vnormalize(to - from);
	#declare	laenge = vlength(to - from);
	#declare	p = from + (laenge - 4 * uvthickness) * richtung;
	cylinder { from, p, uvthickness
		pigment { rgb col }
	}
	cone {
		p, 2 * uvthickness, to, 0
		pigment { rgb col }
	}
#end

#declare bllftcorner = - 0.5 * uvector - 0.5 * vvector;
#declare bulftcorner = - 0.5 * uvector + 0.5 * vvector;
#declare blrtcorner = + 0.5 * uvector - 0.5 * vvector;
#declare burtcorner = + 0.5 * uvector + 0.5 * vvector;

#macro uvvectors(l)
	#declare center = <l, l, l>;
	sphere { center, uvthickness * 2
		pigment { rgb <l, l, l> }
	}
	pfeil(center, center + 0.5 * uvector, l * ucolor)
	pfeil(center, center + 0.5 * vvector, l * vcolor)

	#declare llftcorner = center - 0.5 * uvector - 0.5 * vvector;
	#declare ulftcorner = center - 0.5 * uvector + 0.5 * vvector;
	#declare lrtcorner = center + 0.5 * uvector - 0.5 * vvector;
	#declare urtcorner = center + 0.5 * uvector + 0.5 * vvector;

	union {
		cylinder { llftcorner, ulftcorner, uvthickness * 0.2 }
		cylinder { lrtcorner, urtcorner, uvthickness * 0.2 }
		cylinder { llftcorner, lrtcorner, uvthickness * 0.2 }
		cylinder { ulftcorner, urtcorner, uvthickness * 0.2 }
		pigment { rgb <l, l, l> }
	}

//	mesh {
//		triangle { bllftcorner, bulftcorner, burtcorner }
//		triangle { bllftcorner, blrtcorner, burtcorner }
//
//		// llft-lrt
//		triangle { bllftcorner, blrtcorner, lrtcorner }
//		triangle { bllftcorner, lrtcorner, llftcorner }
//
//		// lrt-urt
//		triangle { blrtcorner, burtcorner, urtcorner }
//		triangle { blrtcorner, urtcorner, lrtcorner }
//
//		// urt-ulft
//		triangle { burtcorner, bulftcorner, ulftcorner }
//		triangle { burtcorner, ulftcorner, urtcorner }
//
//		// ulft-llft
//		triangle { bulftcorner, bllftcorner, llftcorner }
//		triangle { bulftcorner, llftcorner, ulftcorner }
//
//		pigment { rgb 0.7 * <1, 1, 1, 1> }
//	}

//	pfeil(<0,0,0>, <1.1,1.1,1.1>, White)
	pfeil(<1,1,1>, <1.1,1.1,1.1>, White)

	sphere { <0, 0, 0>, uvthickness * 2
		pigment { rgb <0, 0, 0> }
	}
//	sphere { <1, 1, 1>, uvthickness * 2
//		pigment { rgb <1, 1, 1> }
//	}
	#declare lstep = 0.05;
	#declare ll = 0;
	#while (ll < 1)
		cylinder { <ll, ll, ll>, <ll, ll, ll> + lstep, uvthickness
			pigment { rgb <ll, ll, ll> }
		}
	#declare ll = ll + lstep;
	#end

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
		translate center + 0.55 * uvector
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
		translate center + 0.55 * vvector
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
//			-0.40825, -0.40825,  0.81650,
//			-0.70711,  0.70711, -0.00000,
//			-0.57735, -0.57735, -0.57735,
			 0.00000,  0.00000,  0.00000
		>
		translate <1.15, 1.15, 1.15>
	}
#end

