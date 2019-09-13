//
// view.inc
//
// (c) 2019 Prof Dr Andreas Müller, Hochschule Rapperswil
//
#declare skalierung = 2.14;

camera {
        location <0, 0.8, -1>
        look_at <0, 0.8-tan(radians(30)), 0>
        right x * skalierung
        up y * 240/320 * skalierung
}

#include "scene.inc"
