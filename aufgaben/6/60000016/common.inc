//
// common.inc -- common stuff for bubble chamber problem
//
// (c) 2018 Prof Dr Andreas Müller, Hochschule Rapperswi
//

sky_sphere {
	pigment {
		color <1,1,1>
	}
}

light_source {
	<0, 0, 0.02> color 1.3 * White
	looks_like {
		sphere { <0, 0, 0>, 0.05 }
		pigment { color rgb<1,1,0.8>*5 }
		finish { ambient 1 }
	}
	translate <0.5, -0.5, -1>
}


#declare holeradius = 0.1;

#declare I  = <-1.0, 0.0, 0.0>;
#declare P0 = <-0.5, 0.5,-1.0>;
#declare P1 = < 1.0, 0.0, 0.5>;
#declare P2 = < 0.5, 0.5, 1.0>;
#declare S = (2 * I + P1 + P2) / 4;

difference {
	box { <-1,-1,-1>, <1, 1, 1> }
	union {
		box { <-0.99,-0.99,-0.99>, <0.99,0.99 + wand,0.99> }
		cylinder { <-0.5,0.5,-2>, <-0.5,0.5,0>, holeradius }
		cylinder { <0.5,-0.5,-2>, <0.5,-0.5,0>, holeradius }
		cylinder { <-1.5,0,0>, <-0.5,0,0>, holeradius }
	}
	pigment {
		color boxcolor
	}
}

//sphere { <0,0,0>, 0.1
//	pigment { color Red }
//}

#declare bubbleradius = 0.02;

#macro bubbletrace(from, to)
union {
#declare numberofbubbles = 20;
#declare tstep = 1 / (numberofbubbles + 1);
#declare tt = tstep/2;
#while (tt < 1)
	sphere { tt * from + (1 - tt) * to, bubbleradius }
	#declare tt = tt + tstep;
#end
	pigment {
		color rgb<0.2,0.6,1>
	}
}
#end

// trace of bubbles 
bubbletrace(I, S)
bubbletrace(S, P1)
bubbletrace(S, P2)
