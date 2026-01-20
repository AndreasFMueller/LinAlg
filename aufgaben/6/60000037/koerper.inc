/*
 * koerper.inc
 *
 * (c) 2023 Prof Dr Andreas Müller
 */

#declare E1 = <1, 0, 0>;
#declare E2 = <0, 0, 1>;
#declare E3 = <0, 1, 0>;

#declare N = E3;
#declare S = -E3;

#declare A0 = E1;
#declare A1 = vnormalize( E1 + E2);
#declare A2 = E2;
#declare A3 = vnormalize(-E1 + E2);
#declare A4 = -E1;
#declare A5 = vnormalize(-E1 - E2);
#declare A6 = -E2;
#declare A7 = vnormalize( E1 - E2);

#declare N0 = vnormalize(A0 + N);
#declare N1 = vnormalize(A1 + N);
#declare N2 = vnormalize(A2 + N);
#declare N3 = vnormalize(A3 + N);
#declare N4 = vnormalize(A4 + N);
#declare N5 = vnormalize(A5 + N);
#declare N6 = vnormalize(A6 + N);
#declare N7 = vnormalize(A7 + N);

#declare S0 = vnormalize(A0 + S);
#declare S1 = vnormalize(A1 + S);
#declare S2 = vnormalize(A2 + S);
#declare S3 = vnormalize(A3 + S);
#declare S4 = vnormalize(A4 + S);
#declare S5 = vnormalize(A5 + S);
#declare S6 = vnormalize(A6 + S);
#declare S7 = vnormalize(A7 + S);

#macro erde(r)
mesh {
	triangle { N0, N1, N }
	triangle { N1, N2, N }
	triangle { N2, N3, N }
	triangle { N3, N4, N }
	triangle { N4, N5, N }
	triangle { N5, N6, N }
	triangle { N6, N7, N }
	triangle { N7, N0, N }

	triangle { A0, A1, N0 }
	triangle { A1, N1, N0 }
	triangle { A1, A2, N1 }
	triangle { A2, N2, N1 }
	triangle { A2, A3, N2 }
	triangle { A3, N3, N2 }
	triangle { A3, A4, N3 }
	triangle { A4, N4, N3 }
	triangle { A4, A5, N4 }
	triangle { A5, N5, N4 }
	triangle { A5, A6, N5 }
	triangle { A6, N6, N5 }
	triangle { A6, A7, N6 }
	triangle { A7, N7, N6 }
	triangle { A7, A0, N7 }
	triangle { A0, N0, N7 }

	triangle { A0, A1, S0 }
	triangle { A1, S1, S0 }
	triangle { A1, A2, S1 }
	triangle { A2, S2, S1 }
	triangle { A2, A3, S2 }
	triangle { A3, S3, S2 }
	triangle { A3, A4, S3 }
	triangle { A4, S4, S3 }
	triangle { A4, A5, S4 }
	triangle { A5, S5, S4 }
	triangle { A5, A6, S5 }
	triangle { A6, S6, S5 }
	triangle { A6, A7, S6 }
	triangle { A7, S7, S6 }
	triangle { A7, A0, S7 }
	triangle { A0, S0, S7 }

	triangle { S0, S, S1 }
	triangle { S1, S, S2 }
	triangle { S2, S, S3 }
	triangle { S3, S, S4 }
	triangle { S4, S, S5 }
	triangle { S5, S, S6 }
	triangle { S6, S, S7 }
	triangle { S7, S, S0 }

	pigment {
		image_map {
			png "2k_earth_daymap.png" gamma 1.0
			map_type 1
		}
	}
	finish {
		metallic
		specular 0.9
		ambient 0.02
	}
	rotate <0, 180, 0>
	scale r
}
#end
