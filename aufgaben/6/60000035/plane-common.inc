//
// plane-common.inc
//
// (c) 2021 Prof Dr Andreas Mueller, OST Ostschweizer Fachhochschule
//
#version 3.7;
#include "colors.inc"
#include "textures.inc"

object {
#include "plane.inc"
	pigment {
		color planecolor
	}
	finish {
		specular 0.95
		metallic
	}
#if (do_transform2 > 0)
#include "matrix2.inc"
#end
#if (do_transform3 > 0)
#include "matrix3.inc"
#end
}

