#include "colors.inc"

#declare skalierung = 0.38;

camera {
        location <-3.9, 3.4, 7.0>
        look_at <0, -0.2, 0>
        //right 16/9 * x * skalierung
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

#declare w1  = < 1, 1, 1>;
#declare w2  = <-1, 1, 1>;
#declare w3  = < 1,-1, 1>;
#declare w4  = <-1,-1, 1>;
#declare w5  = < 1, 1,-1>;
#declare w6  = <-1, 1,-1>;
#declare w7  = < 1,-1,-1>;
#declare w8  = <-1,-1,-1>;

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

#declare r = 0.12;
object {
	union {
		sphere { w1, r }
		sphere { w3, r }
		sphere { w4, r }
		sphere { w5, r }
		sphere { w6, r }
		sphere { w7, r }
		sphere { w8, r }
		//sphere { v1, 0.75 * r }
		//sphere { v2, 0.75 * r }
		sphere { v3, r }
		//sphere { v4, 0.75 * r }
		//sphere { v5, 0.75 * r }
		sphere { v6, r }
		sphere { v7, r }
		//sphere { v8, 0.75 * r }
		//sphere { v9, 0.75 * r }
		//sphere { v10, 0.75 * r }
		//sphere { v11, 0.75 * r }
		//sphere { v12, 0.75 * r }
		//cylinder { v1, v5, r/2 }
		//cylinder { v1, v6, r/2 }
		//cylinder { v1, v9, r/2 }
		//cylinder { v1, v10, r/2 }
		//cylinder { v2, v5, r/2 }
		//cylinder { v2, v8, r/2 }
		//cylinder { v2, v9, r/2 }
		//cylinder { v2, v12, r/2 }
		cylinder { v3, v6, r/2 }
		cylinder { v3, v7, r/2 }
		//cylinder { v3, v10, r/2 }
		//cylinder { v3, v11, r/2 }
		//cylinder { v4, v7, r/2 }
		//cylinder { v4, v8, r/2 }
		//cylinder { v4, v11, r/2 }
		//cylinder { v4, v12, r/2 }
		//cylinder { v5, v6, r/2 }
		//cylinder { v5, v8, r/2 }
		cylinder { v6, v7, r/2 }
		//cylinder { v7, v8, r/2 }
		//cylinder { v9, v10, r/2 }
		//cylinder { v9, v12, r/2 }
		//cylinder { v10, v11, r/2 }
		//cylinder { v11, v12, r/2 }
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
		cylinder { w6, v3, r/2 }
		cylinder { w1, v6, r/2 }
		cylinder { w4, v7, r/2 }
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
		//sphere { w1, 1.2 * r }
		cylinder { w1, v1, r/2 }
		cylinder { w1, v5, r/2 }
		//cylinder { w1, v6, r/2 }
/*		sphere { w2, 1.2 * r }
		cylinder { w2, v3, r/2 }
		cylinder { w2, v6, r/2 }
		cylinder { w2, v7, r/2 }
*/
		//sphere { w3, 1.2 * r }
		cylinder { w3, v2, r/2 }
		cylinder { w3, v5, r/2 }
		cylinder { w3, v8, r/2 }
		//sphere { w4, 1.2 * r }
		cylinder { w4, v4, r/2 }
		//cylinder { w4, v7, r/2 }
		cylinder { w4, v8, r/2 }
		//sphere { w5, 1.2 * r }
		cylinder { w5, v1, r/2 }
		cylinder { w5, v9, r/2 }
		cylinder { w5, v10, r/2 }
		//sphere { w6, 1.2 * r }
		//cylinder { w6, v3, r/2 }
		cylinder { w6, v11, r/2 }
		cylinder { w6, v10, r/2 }
		//sphere { w7, 1.2 * r }
		cylinder { w7, v2, r/2 }
		cylinder { w7, v9, r/2 }
		cylinder { w7, v12, r/2 }
		//sphere { w8, 1.2 * r }
		cylinder { w8, v4, r/2 }
		cylinder { w8, v11, r/2 }
		cylinder { w8, v12, r/2 }
		pigment {
			color rgb <1, 0, 0>
		}
		finish {
			specular 0.9
			metallic
		}
	}
}

