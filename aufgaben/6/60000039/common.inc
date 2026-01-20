//
// common.inc -- common settings for shamizen problem
//
// (c) 2023 Prof Dr Andreas Müller
//
#version 3.7;
#include "colors.inc"
#include "textures.inc"

global_settings {
	assumed_gamma 1
}

#declare imagescale = 0.051;

#declare O = <0, 0, 0>;
#declare E1 = <1, 0, 0>;
#declare E2 = <0, 0, 1>;
#declare E3 = <0, 1, 0>;
#declare e1farbe = rgb<0.8,0.6,0.6>;
#declare e2farbe = rgb<0.6,0.8,0.6>;
#declare e3farbe = rgb<0.6,0.6,0.8>;
#declare winkelfarbe = rgbf<1.0,0.8,0,0.5>;
#declare Cameracenter = <20, 5, 12>;
#declare Worldpoint = 0.35 * E3 - 0.3 * E1;
#declare Lightsource = <70,100,130>;
#declare Lightdirection = vnormalize(Lightsource - Worldpoint);
#declare Lightaxis1 = vnormalize(vcross(Lightdirection, <0,1,0>));
#declare Lightaxis2 = vnormalize(vcross(Lightaxis1, Lightdirection));

camera {
	location Cameracenter
	look_at Worldpoint
	right 16/9 * x * imagescale
	up y * imagescale
}

light_source {
	Lightsource color White
	area_light Lightaxis1 Lightaxis2, 10, 10
	adaptive 1
	jitter
}

sky_sphere {
	pigment {
		color White
	}
}

#macro shamizen()
object {
#include "shamizen.mesh"
	pigment {
		color rgb<0.6,0.4,0.2>
	}
	finish {
		metallic
		specular 0.99
	}
	translate -0.5 * center_of_mass
	translate <0, 0.2, 0>
}
#end

#declare achsenfarbe = rgb<0.6,0.8,1.0>;

#macro achsen()
	arrow(O, E1, 0.01, e1farbe)
	arrow(O, E2, 0.01, e2farbe)
	arrow(O, E3, 0.01, e3farbe)
#end
