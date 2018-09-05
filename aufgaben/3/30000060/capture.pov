//
// capture.pov -- view inside the bubble chamger
//
// (c) 2018 Prof Dr Andreas Müller, Hochschule Rapperswil
//
#include "colors.inc"

#declare skalierung = 1.3;

#declare boxcolor = rgb<0.9,0.9,1>;
#declare wand = 0;

camera {
	location <-0.5, 0.5, -1>
	look_at <0, 0, 0>
	right 16/9 * x * skalierung
	up y * skalierung
}

#include "common.inc"

