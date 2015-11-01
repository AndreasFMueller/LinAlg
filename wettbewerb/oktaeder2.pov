#include "colors.inc"

#declare skalierung = 0.39;

camera {
        location <-1.2, 3.4, 7.0>
        look_at <0, 0, 0>
        right x * skalierung
        up y * skalierung
}

light_source { <-5, 8, -5> color White }
light_source { <0, -5, 3> color <0.5,0.5,0.5> }
sky_sphere {
        pigment {
                color <1,1,1>
        }
}

#declare r = 0.1;
#declare d = 0.5*r;

#declare s = 1.4;
#declare w1 = < 0, 0, 1 > * s;
#declare w2 = < 1, 0, 0 > * s;
#declare w3 = < 0, 1, 0 > * s;
#declare w4 = <-1, 0, 0 > * s;
#declare w5 = < 0,-1, 0 > * s;
#declare w6 = < 0, 0,-1 > * s;

#declare w7  = < 0.5, 0.5, 0.5 > * s;
#declare w8  = <-0.5, 0.5, 0.5 > * s;
#declare w9  = <-0.5,-0.5, 0.5 > * s;
#declare w10 = < 0.5,-0.5, 0.5 > * s;

#declare w11 = < 0.5, 0.5,-0.5 > * s;
#declare w12 = <-0.5, 0.5,-0.5 > * s;
#declare w13 = <-0.5,-0.5,-0.5 > * s;
#declare w14 = < 0.5,-0.5,-0.5 > * s;

object {
	union {
		sphere { w1, r }
		sphere { w2, r }
		sphere { w3, r }
		sphere { w4, r }
		sphere { w5, r }
		sphere { w6, r }
		//sphere { w7, r }
		sphere { w8, r }
		//sphere { w9, r }
		//sphere { w10, r }
		//sphere { w11, r }
		//sphere { w12, r }
		//sphere { w13, r }
		//sphere { w14, r }
		//cylinder { w1, w7, r/2 }
		cylinder { w1, w8, r/2 }
		//cylinder { w1, w9, r/2 }
		//cylinder { w1, w10, r/2 }
		//cylinder { w2, w7, r/2 }
		//cylinder { w2, w10, r/2 }
		//cylinder { w2, w11, r/2 }
		//cylinder { w2, w14, r/2 }
		//cylinder { w3, w7, r/2 }
		cylinder { w3, w8, r/2 }
		//cylinder { w3, w11, r/2 }
		//cylinder { w3, w12, r/2 }
		cylinder { w4, w8, r/2 }
		//cylinder { w4, w9, r/2 }
		//cylinder { w4, w12, r/2 }
		//cylinder { w4, w13, r/2 }
		//cylinder { w5, w9, r/2 }
		//cylinder { w5, w10, r/2 }
		//cylinder { w5, w13, r/2 }
		//cylinder { w5, w14, r/2 }
		//cylinder { w6, w11, r/2 }
		//cylinder { w6, w12, r/2 }
		//cylinder { w6, w13, r/2 }
		//cylinder { w6, w14, r/2 }
		pigment {
			color rgb <0.95,0.95,0.95>
		}
		finish {
			specular 0.9
			metallic
		}
	}
}
object {
	union {
		cylinder { w3, w1, r/2 }
		cylinder { w3, w4, r/2 }
		cylinder { w1, w4, r/2 }
		pigment {
			color rgb <1,1,0>
		}
		finish {
			specular 0.9
			metallic
		}
	}
}
object {
	union {
		cylinder { w3, w2, r/2 }
		cylinder { w3, w2, r/2 }
		cylinder { w3, w6, r/2 }
		cylinder { w3, w6, r/2 }
		cylinder { w5, w1, r/2 }
		cylinder { w5, w1, r/2 }
		cylinder { w5, w2, r/2 }
		cylinder { w5, w2, r/2 }
		cylinder { w5, w4, r/2 }
		cylinder { w5, w4, r/2 }
		cylinder { w5, w6, r/2 }
		cylinder { w5, w6, r/2 }
		cylinder { w4, w6, r/2 }
		cylinder { w4, w6, r/2 }
		cylinder { w6, w2, r/2 }
		cylinder { w6, w2, r/2 }
		cylinder { w2, w1, r/2 }
		cylinder { w2, w1, r/2 }

		pigment {
			color rgb <1,0,0>
		}
		finish {
			specular 0.9
			metallic
		}
	}
}

