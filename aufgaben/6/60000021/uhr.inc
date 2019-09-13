//
// uhr.inc
//
// (c) 2019 Prof Dr Andreas Müller
//
#declare skalierung = 0.77;

camera {
        location <3, 2.5, 2>
        look_at <0.0, 0.0, 0.0>
        right x * skalierung
        up y * skalierung
}

#include "camera.inc"
#include "scene.inc"

