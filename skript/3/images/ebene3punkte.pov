//
// ebene3punkte.pov -- Durchstosspunkt Gerade - Ebene
//
// (c) 2018 Prof Dr Anderas Müller, Hochschule Rapperswil
//
#version 3.7;
#include "colors.inc"
#include "../../0-common/common.inc"

global_settings {
	assumed_gamma 1
}

#declare imagescale = 0.4;

#declare O = <0, 0, 0>;
#declare e1 = <1, 0, 0>;
#declare e2 = <0, 0, 1>;
#declare e3 = <0, 1, 0>;

#declare P0 = <0.1, 1.5,  0.2>;
#declare Q0 = <4, 0, -1>;
#declare U = vnormalize(<2, -0.2, -0.5>);
#declare V = vnormalize(<0.5, 0.5, 1.5>);

#declare A = P0 + 0.5 * U + 0.5 * V;
#declare B = A + 1.8 * U + 0.1 * V;
#declare C = A + 0.2 * U + 1.6 * V;
#declare R1 = B - A;
#declare R2 = C - A;

#macro ebene(tval, sval)
	A + tval * R1 + sval * R2
#end

#declare at = 0.04;

camera {
	location <2.4, 4.3, -10>
	look_at <2.4, 1.4, 0.5>
	right 16/9 * x * imagescale
	up y * imagescale
}

light_source {
	<-3, 4, -3> color White
	area_light <0.1,0,0> <0,0,0.1>, 10, 10
	adaptive 1
	jitter
}

sky_sphere {
	pigment {
		color rgb<1,1,1>
	}
}

sphere {
	O, 1.3*at
	pigment {
		color Red
	}
}

union {
	cylinder { <-10,0,0>, <10,0,0>, at / 3 }
	cylinder { <0,-10,0>, <0,10,0>, at / 3 }
	cylinder { <0,0,-10>, <0,0,100>, at / 3 }
	pigment {
		color White
	}
	finish {
		specular 0.9
		metallic
	}
}

#declare Rot = rgb<0.8, 0.2, 0.2>;
#declare Blau = rgb<0.2, 0.4, 0.8>;
#declare Gruen = rgb<0.2,0.6,0.0>;
#declare Magenta = rgb<0.8,0.2,0.6>;

arrow(O, e1, at, White)
arrow(O, e2, at, White)
arrow(O, e3, at, White)

arrow(O, A, at, Rot)
arrow(O, B, at, Gruen)
arrow(O, C, at, Blau)

arrow(A, B, at, Orange)
arrow(A, C, at, Magenta)

sphere { A, 2*at
	pigment {
		color Rot
	}
	finish {
		specular 0.9
		metallic
	}
}
sphere { B, 2*at
	pigment {
		color Gruen
	}
	finish {
		specular 0.9
		metallic
	}
}
sphere { C, 2*at
	pigment {
		color Blau
	}
	finish {
		specular 0.9
		metallic
	}
}

#declare tmin = -0.5;
#declare tmax =  1.5;
#declare tstep = 0.1;
#declare smin = -0.5;
#declare smax =  1.5;
#declare sstep = 0.1;

#declare E1 = ebene(tmin, smin);
#declare E2 = ebene(tmax, smin);
#declare E3 = ebene(tmax, smax);
#declare E4 = ebene(tmin, smax);

#macro showgrid(tstart, sstart, gridlineradius)
union {
	#declare tindex = tstart;
	#while (tindex < tmax)
		cylinder { ebene(tindex, smin), ebene(tindex, smax), gridlineradius }
		#declare tindex = tindex + tstep;
	#end
	#declare sindex = sstart;
	#while (sindex < smax)
		cylinder { ebene(tmin, sindex), ebene(tmax, sindex), gridlineradius }
		#declare sindex = sindex + sstep;
	#end
	pigment {
		color rgb<0.8,0.8,1>
	}
}
#end

showgrid(-0.4, -0.4, at / 8)

#declare tstep = 1;
#declare sstep = 1;
#declare gridlineradius = at / 2;

showgrid(0, 0, at / 2)

mesh {
	triangle { E1, E2, E3 }
	triangle { E1, E3, E4 }
	pigment {
		color rgbt<0.8,0.8,1,0.2>
	}
}


