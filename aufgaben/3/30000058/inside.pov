//
// inside.pov
//
// (c) 2018 Prof Dr Andreas Müller, Hochschule Rapperswil
//
#include "colors.inc"

#declare o = -1;
#declare skalierung = 3;

#declare boxcolor = rgb<0.9,0.9,1>;
#declare wand = 0;

camera {
	location <-0.5 * o, -0.5, -1>
	look_at <(-0.5 + 0.2) * o, -0.5, 1>
	right 16/9 * x * skalierung
	up y * skalierung
}

light_source { <0.5 * o, -0.7, -0.9>, color White }

#include "common.inc"
