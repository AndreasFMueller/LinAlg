#include "colors.inc"

#declare skalierung = 0.45;

camera {
        location <-1.2, 3.4, 7.0>
        look_at <0, 0, 0>
        right 16/9 * x * skalierung
        up y * skalierung
}

light_source { <-5, 8, -5> color White }
light_source { <0, -5, 3> color <0.5,0.5,0.5> }
sky_sphere {
        pigment {
                color <1,1,1>
        }
}

#declare v1  = < 1, 1, 0>;
#declare v2  = < 1,-1, 0>;
#declare v3  = <-1, 1, 0>;
#declare v4  = <-1,-1, 0>;
#declare v5  = < 1, 0, 1>;
#declare v6  = < 0, 1, 1>;
#declare v7  = <-1, 0, 1>;
#declare v8  = < 0,-1, 1>;
#declare v9  = < 1, 0,-1>;
#declare v10 = < 0, 1,-1>;
#declare v11 = <-1, 0,-1>;
#declare v12 = < 0,-1,-1>;

#declare r = 0.1;
object {
	union {
		sphere { v1, r }
		sphere { v2, r }
		sphere { v3, r }
		sphere { v4, r }
		sphere { v5, r }
		sphere { v6, r }
		sphere { v7, r }
		sphere { v8, r }
		sphere { v9, r }
		sphere { v10, r }
		sphere { v11, r }
		sphere { v12, r }
		cylinder { v1, v5, r/2 }
		cylinder { v1, v6, r/2 }
		cylinder { v1, v9, r/2 }
		cylinder { v1, v10, r/2 }
		cylinder { v2, v5, r/2 }
		cylinder { v2, v8, r/2 }
		cylinder { v2, v9, r/2 }
		cylinder { v2, v12, r/2 }
		cylinder { v3, v6, r/2 }
		cylinder { v3, v7, r/2 }
		cylinder { v3, v10, r/2 }
		cylinder { v3, v11, r/2 }
		cylinder { v4, v7, r/2 }
		cylinder { v4, v8, r/2 }
		cylinder { v4, v11, r/2 }
		cylinder { v4, v12, r/2 }
		cylinder { v5, v6, r/2 }
		cylinder { v5, v8, r/2 }
		cylinder { v6, v7, r/2 }
		cylinder { v7, v8, r/2 }
		cylinder { v9, v10, r/2 }
		cylinder { v9, v12, r/2 }
		cylinder { v10, v11, r/2 }
		cylinder { v11, v12, r/2 }
		pigment {
			color rgb <0.95,0.95,0.95>
		}
		finish {
			specular 0.9
			metallic
		}
	}
	translate <1.5, 0, 0>
}

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
		sphere { w7, r }
		sphere { w8, r }
		sphere { w9, r }
		sphere { w10, r }
		sphere { w11, r }
		sphere { w12, r }
		sphere { w13, r }
		sphere { w14, r }
		cylinder { w1, w7, r/2 }
		cylinder { w1, w8, r/2 }
		cylinder { w1, w9, r/2 }
		cylinder { w1, w10, r/2 }
		cylinder { w2, w7, r/2 }
		cylinder { w2, w10, r/2 }
		cylinder { w2, w11, r/2 }
		cylinder { w2, w14, r/2 }
		cylinder { w3, w7, r/2 }
		cylinder { w3, w8, r/2 }
		cylinder { w3, w11, r/2 }
		cylinder { w3, w12, r/2 }
		cylinder { w4, w8, r/2 }
		cylinder { w4, w9, r/2 }
		cylinder { w4, w12, r/2 }
		cylinder { w4, w13, r/2 }
		cylinder { w5, w9, r/2 }
		cylinder { w5, w10, r/2 }
		cylinder { w5, w13, r/2 }
		cylinder { w5, w14, r/2 }
		cylinder { w6, w11, r/2 }
		cylinder { w6, w12, r/2 }
		cylinder { w6, w13, r/2 }
		cylinder { w6, w14, r/2 }
		pigment {
			color rgb <0.95,0.95,0.95>
		}
		finish {
			specular 0.9
			metallic
		}
	}
	translate <-1.5, 0, 0>
}

