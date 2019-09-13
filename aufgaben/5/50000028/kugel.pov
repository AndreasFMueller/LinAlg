//
// roll.pov
//
// (c) 2019 Prof Dr Andreas Müller, Hochschule Rapperswil
//
#version 3.7;

#declare skalierung = 1;

#declare T = 0.2;

#include "scene.inc"

camera {
        location <3, 25, 20>
        look_at <6.0, 0.0, 0.0>
        right x * skalierung
        up y * skalierung * 9/16
}

