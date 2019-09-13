//
// camera.inc
//
// (c) 2019 Prof Dr Andreas Müller, Hochschule Rapperswil
//
#declare cd = 0.13;
#declare C = <0, 0.8, -1>;
union {
	box { <-cd/2, -cd/2, -cd/2>, <cd/2, cd/2, cd/2> }
	cylinder { <0, 0, >, <0, 0, 0.9 * cd>, 0.4 * cd }
	pigment {
		color rgb<0.8, 0.6, 0.6>
	}
	finish {
                specular 0.2
                metallic
        }
	rotate <30, 0, 0>
	translate C
}

#declare fradius = 0.4;
#declare F1 = < fradius * sin(radians(60)), -0.8, fradius * cos(radians(60))>;
#declare F2 = < 0, -0.8, -fradius>;
#declare F3 = < fradius * sin(radians(-60)), -0.8, fradius * cos(radians(-60))>;
#declare Fradius = 0.1 * cd;
union {
	cylinder { <0, 0, 0>, F1, Fradius }
	cylinder { <0, 0, 0>, F2, Fradius }
	cylinder { <0, 0, 0>, F3, Fradius }
	sphere { F1, 1.5*Fradius }
	sphere { F2, 1.5*Fradius }
	sphere { F3, 1.5*Fradius }
	
	pigment {
		color rgb<0.8, 0.6, 0.6>
	}
	finish {
                specular 0.2
                metallic
        }
	translate C
}
