//
// common.inc
//
// (c) 2018 Prof Dr Andreas Müller, HOchshcule Rapperswil
//
#declare skalierung = 0.44;

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
#declare axisstart = -1.2;
#declare axisend = 1.2;

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

#macro rechteck(e1, e2, e3, e4)
	triangle { e1, e2, e3 }
	triangle { e1, e3, e4 }
#end

mesh {
	rechteck(A1, C1, C2, A2)
	pigment {
		color Orange
	}
	finish {
		specular 0.2
		metallic
	}
}
mesh {
	rechteck(A2, C2, C3, A3)
	rechteck(A3, C3, C4, A4)
	rechteck(A4, C4, C5, A5)
	rechteck(A5, C5, C6, A6)
	rechteck(A6, C6, C1, A1)
	triangle { A1, A2, A3 }
	triangle { A1, A3, A4 }
	triangle { A1, A4, A5 }
	triangle { A1, A5, A6 }
	triangle { C1, C2, C3 }
	triangle { C1, C3, C4 }
	triangle { C1, C4, C5 }
	triangle { C1, C5, C6 }
	pigment {
		color rgb<0.5, 0.5, 0.6>
	}
	finish {
		specular 0.2
		metallic
	}
}

#declare P = <sqrt(3)/3, 1, 1>;

union {
	sphere { A1, 2 * axisradius }
	sphere { B, 2 * axisradius }
	pigment {
		color Red
	}
	finish {
		specular 0.2
		metallic
	}
}

#declare showaxis = 1;

#if (showaxis)
sphere { P, 2 * axisradius
	pigment {
		color Red
	}
	finish {
		specular 0.2
		metallic
	}
}
union {
	axis(-P, 1.3 * P)
	pigment {
		color Gold
	}
	finish {
		specular 0.2
		metallic
	}
}
#end
