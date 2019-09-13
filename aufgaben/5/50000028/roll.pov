//
// roll.pov
//
// (c) 2019 Prof Dr Andreas Müller, Hochschule Rapperswil
//
#version 3.7;

#declare skalierung = 1;

#declare T = clock * clock;

#include "scene.inc"

camera {
	location E + 2 * (E - D) + <1, -1, 0>
//        location <30, 25, 20>
        look_at <6.0, 1.0, 0.0>
        right x * skalierung
        up y * skalierung * 9/16
}

