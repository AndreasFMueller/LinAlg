//
// scene.inc
//
// (c) 2019 Prof Dr Andreas Müller
//
#declare O = < 0, 0, 0 >;
#declare N = < 0, sin(radians(30)), cos(radians(30)) >;
#declare C = <0, -1, 0.8>;

#declare drehwinkel = -radians(15) * (12 - k);

#declare U = <0, sin(radians(7.45)), cos(radians(7.45))>;
#declare c = cos(drehwinkel);
#declare s = sin(drehwinkel);

#declare R = <(1 - c) * U.x * U.y - U.z * s, c + (1- c) * U.y * U.y, (1 - c) * U.y * U.z + U.x * s>;
//#declare R = <0, 1, 0>;

sky_sphere {
        pigment {
                color <1,1,1>
        }
}

light_source {
        R * 1000 color White
}

#declare axisradius = 0.02;
#declare axisstart = -1.4;
#declare axisend = 1.4;

#macro axis(from, to)
        cylinder { from, to, axisradius }
        cone {
                to, 2 * axisradius,
                to + 6 * axisradius * vnormalize(to - from), 0
        }
#end

union {
        axis(<axisstart, 0, 0>, <axisend, 0, 0>)
        axis(<0, axisstart, 0>, <0, axisend, 0>)
        axis(<0, 0, axisstart>, <0, 0, axisend>)
	cylinder { <0, -0.001, 0>, <0, 0.001, 0>, 1.3 }
        pigment {
                color rgb<0.8,0.8,0.8>
        }
        finish {
                specular 0.2
                metallic
        }
	no_shadow
}

#declare ra = 0.04;

union {
	sphere { <0, 0, 0>, ra }
	cylinder { <0, 0, 0>, N, ra }
	sphere { N, 2 * ra }
	pigment {
		color rgb<0.7, 0.7, 0.9>
	}
        finish {
                specular 0.2
                metallic
        }
}
