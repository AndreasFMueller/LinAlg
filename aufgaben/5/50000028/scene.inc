//
// scene.inc
//
// (c) 2019 Prof Dr Andreas Müller
//
#include "colors.inc"
#include "textures.inc"

sky_sphere {
	pigment {
		color <1,1,1>
	}
}

light_source {
//	<10, 20, -10> color White
	<10, 20, 5> color White
}

#declare A = <12, 0, 0>;
#declare B = <0, 5, 0>;
#declare C = <12, 0, 5>;

#declare D = <4, 6, -5>;
#declare E = <8, 10, 5>;

#declare DE = E - D;
#declare AB = B - A;
#declare AC = C - A;
#declare n = vnormalize(vcross(AB, AC));

#declare A2 = A + 2 * n;
#declare B2 = B + 2 * n;

#declare axisradius = 0.1;

#macro axis(from, to)
        cylinder { from, to, axisradius }
        cone {
                to, 2 * axisradius,
                to + 6 * axisradius * vnormalize(to - from), 0
        }
#end

union {
        axis(<-1, 0, 0>, <14, 0, 0>)
        axis(<0, -1, 0>, <0, 8, 0>)
        axis(<0, 0, -1>, <0, 0, 8>)
        pigment {
                color rgb<0.8,0.8,0.8>
        }
        finish {
                specular 0.2
                metallic
        }
        no_shadow
}

#declare r1 = vnormalize(AC);
#declare r2 = vnormalize(AB);

#declare E1 = A - 2 * r1 - 2 * r2;
#declare E2 = A + 7 * r1 - 2 * r2;
#declare E3 = A - 2 * r1 + 15 * r2;
#declare E4 = A + 7 * r1 + 15 * r2;

mesh {
	triangle { E1, E2, E4 }
	triangle { E1, E4, E3 }
	pigment {
		color rgbf<0.6, 0.6, 0.8, 0.2>
	}
        finish {
                specular 0.2
                metallic
        }
}

sphere {
	<0, 0, 0>, 2
	pigment {
		White_Marble
	}
	//pigment {
	//	image_map {
	//		jpeg "tc-earth_daymap.jpg"
	//		map_type 1
	//	}
	//}
	//pigment {
	//	color rgb<0.8,0.6,0.6>
	//}
        finish {
        	specular 0.2
        	metallic
        }
	rotate <0, 0, degrees(-T * 13 / 2)>
	translate T * A2 + (1 - T) * B2
}

#declare E1 = 2 * E - D;
#declare D1 = 2 * D - E;

difference {
	cylinder { E, D, 0.5 }
	cylinder { E1, D1, 0.45 }
	
	texture {
		Cork
		//color rgb<0.6,0.8,0.6>
	}
        finish {
                specular 0.2
                metallic
        }
}

union {
	sphere { A 0.2 }
	sphere { B 0.2 }
	sphere { C 0.2 }
	sphere { D 0.2 }
	sphere { E 0.2 }
	pigment {
		color Red
	}
        finish {
                specular 0.2
                metallic
        }
}

cylinder { A, B, 0.25 * axisradius
	pigment {
		color rgbf<0.6, 0.6, 0.8, 0.2>
	}
	finish {
		specular 0.2
		metallic
	}
}

