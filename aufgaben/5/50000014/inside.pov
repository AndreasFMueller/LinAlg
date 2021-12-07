#include "colors.inc"
#include "textures.inc"
#include "finish.inc"
#include "common.inc"

#declare s = 1.4;

light_source {
	C + 1.3*r2 - 0.2*rechts + 0.2*oben color White
}

light_source {
	C + 0.1*r2 - 0.2*rechts + 0.2*oben color White
}

camera {
	location C + 0.8 * r2 + 0.40*rechts
	look_at C + 0.4 * r2 - 0.5*rechts + 0.*<0,1.7,0>
	right x * 0.8
	up y * 0.8
}


