//
// cube.pov -- display an RGB colored cube
//
// (c) 2016 Prof Dr Andreas Müller, Hochschule Rapperswil
//

#macro clippedcube(C)

union {
#declare step = 0.02;
#declare r = 0;
#while (r < 1)
#declare g = 0;
#while (g < 1)
#declare b = 0;
#while (b < 1)
object {
	intersection {
		box { <r,g,b>, <r+step,g+step,b+step> }
		C
	}
	pigment { color rgb<r,g,b> }
}
#declare b = b + step;
#end
#declare g = g + step;
#end
#declare r = r + step;
#end
}

#end


