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
}

