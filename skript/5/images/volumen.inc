//
// volumen.inc
//
// (c) 2018 Prof Dr Andreas Müller, Hochschule Rapperswil
//
#version 3.7;
#include "colors.inc"
#include "../../0-common/common.inc"

global_settings {
	assumed_gamma 1
}

#declare imagescale = 0.4;

camera {
        location <3.1, 2.3, -18>
        look_at <2.1, -1.6, 0.5>
        right 16/9 * x * imagescale
        up y * imagescale
}

light_source {
	<4, 9, -5> color White
	area_light <1.3,0,0> <0,0,1.3>, 10, 10
	adaptive 1
	jitter
}

sky_sphere {
        pigment {
                color rgb<1,1,1>
        }
}

#declare O = <0, 0, 0>;
#declare A1 = <2,-0.5,-0.5>;
#declare A2 = <3,0.75,0.9>;
#declare A = A1 + A2;
#declare B = <0.5,-4,0.1>;
#declare C = <0.7,0.2,3>;

#declare at = 0.05;

#declare n = vnormalize(vcross(B, C));

#declare U = vnormalize(vcross(n, <0,1,0>));
#declare V = vnormalize(vcross(U, n));

#declare E = O + 1.5*U + 1.5*V;
#declare F = O + 1.5*U - 4.8*V;
#declare G = O - 5.4*U + 1.5*V;
#declare H = O - 5.4*U - 4.8*V;

#declare delta = n * vdot(n, A);

#declare P = O + 0.5*U + 0.75*V;
#declare Q = P + delta;

#declare epsilon = <0.001, 0, 0>;

mesh {
	triangle { A+epsilon, A+B+epsilon, A+B+C+epsilon }
	triangle { A+epsilon, A+B+C+epsilon, A+C+epsilon }
	pigment {
		color rgb<1,0.2,0.6>*2
	}
}

mesh {
	triangle { E, F, H }
	triangle { E, H, G }

	triangle { E+delta, F+delta, H+delta }
	triangle { E+delta, H+delta, G+delta }

	pigment {
		color rgbt<0.8,0.8,1,0.5>
	}
}


union {
	cylinder { P, Q, at }
	sphere { P, at }
	sphere { Q, at }
	pigment {
		color Yellow
	}
	finish {
		specular 0.9
		metallic
	}
}

rechterwinkel(P, U, -n, Yellow)
rechterwinkel(P, V, -n, Yellow)

rechterwinkel(Q, n, U, Yellow)
rechterwinkel(Q, V, n, Yellow)


