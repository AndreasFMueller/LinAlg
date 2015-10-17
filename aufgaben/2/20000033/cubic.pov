#include "colors.inc"

#declare skalierung = 0.6;
#declare axisthickness = 0.02;
#declare vscale = 0.18;

camera {
        location <-0.5, 2.8, -8>
        look_at <0, 0, 0>
        right 16/9 * x * skalierung
        up y * skalierung
}

light_source { <-17, 5, -7> color White }
/* light_source { <1, 8,  4> color White } */
light_source { <0, -5, 3> color <0.5,0.5,0.5> }
sky_sphere {
        pigment {
                color <1,1,1>
        }
}


#declare d = 0.005;

union {
        cylinder { <0,0,-2.1>, <0,0,2.1>, axisthickness }
        cone { <0,0,2.1>, 2*axisthickness, <0,0,2.2> 0 }
        cylinder { <-2.1,0,0>, <2.1,0,0>, axisthickness }
        cone { <2.1,0,0>, 2*axisthickness, <2.2,0,0> 0 }
        cylinder { <0,-2.1,0>, <0,2.1,0>, axisthickness }
        cone { <0,2.1,0>, 2*axisthickness, <0,2.2,0>, 0 }
        sphere { <0,0,0>, axisthickness }
        pigment {
                color rgb <0.95,0.95,0.95>
        }
        finish {
                specular 0.9
                metallic
        }
}

#macro surfacepoint(uu, vv)
	<uu, (uu * uu * uu + vv * vv * vv - 3 * uu * vv + 1) * vscale, vv>
#end

#declare usteps = 100;
#declare du = 2 / usteps;
#declare vsteps = 100;
#declare dv = 2 / vsteps;

#declare zeroradius = 0.03;
union {
	sphere { <1,0,1>, zeroradius }
	cylinder { <-2,0,1>, <1,0,-2>, zeroradius }
	sphere { <-2,0,1>, zeroradius }
	sphere { <1,0,-2>, zeroradius }
	pigment { color rgb <1,1,0> }
	finish {
		diffuse 0.7
		specular 0.9
		metallic
	}
}

#macro surfacequad(uu, vv)
	triangle {
		surfacepoint(uu     , vv     ),
		surfacepoint(uu + du, vv     ),
		surfacepoint(uu + du, vv + dv)
	}
	triangle {
		surfacepoint(uu     , vv     ),
		surfacepoint(uu     , vv + dv),
		surfacepoint(uu + du, vv + dv)
	}
#end

intersection {
object {
mesh {
#declare iu = -usteps;
#while (iu < usteps)
#declare iv = -vsteps;
#while (iv < vsteps)
surfacequad(iu * du, iv * dv)
#declare iv = iv + 1;
#end
#declare iu = iu + 1;
#end
}
}
	box { <-2,-1,-2>, <2,2,2> }
	pigment { color rgb <1,0,0> }
	finish {
		diffuse 0.7
		specular 0.9
		metallic
	}
}
