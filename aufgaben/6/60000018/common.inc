//
// common.inc
//
// (c) 2018 Prof Dr Andreas Müller, HOchshcule Rapperswil
//
#declare skalierung = 0.37;

camera {
        location <3, 2.5, 5>
        look_at <0.0, 0.0, 0.0>
        right x * skalierung
        up y * skalierung
}

sky_sphere {
	pigment {
		color <1,1,1>
	}
}

light_source {
        <8, 4, 10> color White
}

#declare axisradius = 0.02;
#declare axisstart = -1.1;
#declare axisend = 1.1;

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
	pigment {
		color rgb<0.8,0.8,0.8>
	}
	finish {
		specular 0.2
		metallic
	}
}

mesh {
	triangle { A1, A2, B }
	triangle { A2, A3, B }
	triangle { A3, A4, B }
	triangle { A4, A5, B }
	triangle { A1, A2, B }
	triangle { A1, A2, D }
	triangle { A2, A3, D }
	triangle { A3, A4, D }
	triangle { A4, A5, D }
	triangle { A5, A1, D }
	pigment {
		color rgb<0.5, 0.5, 0.6>
	}
	finish {
		specular 0.2
		metallic
	}
}
mesh {
	triangle { A5, A1, B }
	pigment {
		color Orange
	}
	finish {
		specular 0.2
		metallic
	}
}

union {
	sphere { A1, 2 * axisradius }
	sphere { A5, 2 * axisradius }
	sphere { B, 2 * axisradius }
	pigment {
		color Red
	}
	finish {
		specular 0.2
		metallic
	}
}
