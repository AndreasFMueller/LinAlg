//
// rgbaxes.inc -- add RGB axes
//
// (c) 2016 Prof Dr Andreas Müller, Hochschule Rapperswil
//

#declare step = 0.02;
#declare d = 0.02;

#declare r = 0;
#while (r < 1)
object {
	cylinder { <r, 0, 0>, <r + step, 0, 0>, d }
	pigment { rgb <r, 0, 0> }
}
#declare r = r + step;
#end
cylinder { <1, 0, 0>, <1.1, 0, 0>, d
	pigment { rgb <1, 0, 0> }
}
cone { <1.1, 0, 0>, 2 * d, <1.1 + 5 * d, 0, 0>, 0
	pigment { rgb <1, 0, 0> }
}

#declare g = 0;
#while (g < 1)
object {
	cylinder { <0, g, 0>, <0, g + step, 0>, d }
	pigment { rgb <0, g, 0> }
}
#declare g = g + step;
#end
cylinder { <0, 1, 0>, <0, 1.1, 0>, d
	pigment { rgb <0, 1, 0> }
}
cone { <0, 1.1, 0>, 2 * d, <0, 1.1 + 5 * d, 0>, 0
	pigment { rgb <0, 1, 0> }
}

#declare b = 0;
#while (b < 1)
object {
	cylinder { <0, 0, b>, <0, 0, b + step>, d }
	pigment { rgb <0, 0, b> }
}
#declare b = b + step;
#end
cylinder { <0, 0, 1>, <0, 0, 1.1>, d
	pigment { rgb <0, 0, 1> }
}
cone { <0, 0, 1.1>, 2 * d, <0, 0, 1.1 + 5 * d>, 0
	pigment { rgb <0, 0, 1> }
}

