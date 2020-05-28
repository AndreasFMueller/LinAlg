//
// signal.inc
//
// (c) 2020 Prof Dr Andreas Müller, Hochschule Rapperswil
//

#declare I = function(tt) {
	R * 8/(pi * pi) * (sin(tt) -
	sin(3*tt) / 9 +
	sin(5*tt) / 25 -
	sin(7*tt) / 49 +
	sin(9*tt) / 81 -
	sin(11*tt) / 121 +
	sin(13*tt) / 169
	)
}

#declare l = 0.91;

#declare pov = function(a, b) { exp(log(a) * b) }

#declare Q = function(tt, qq) {
	qq * R * (4/pi) * (
	       sin(     tt * 2)      +
	pov(l, 2) * sin( 3 * tt * 2) / 3  +
	pov(l, 3) * sin( 5 * tt * 2) / 5  +
	pov(l, 4) * sin( 7 * tt * 2) / 7  +
	pov(l, 5) * sin( 9 * tt * 2) / 9  +
	pov(l, 6) * sin(11 * tt * 2) / 11 +
	pov(l, 7) * sin(13 * tt * 2) / 13 +
	pov(l, 8) * sin(15 * tt * 2) / 15 +
	pov(l, 9) * sin(17 * tt * 2) / 17 +
	pov(l,10) * sin(19 * tt * 2) / 19
	)
}

#macro puresignal(tt)
	< I(tt), Q(tt, q), -tt>
#end

#declare T = function(tt) { (dOmega + Omega) * tt };
#declare dT = function(tt) { (dOmega - Omega) * tt }

#macro signal(tt) 
	<
		g * (
		(1-p/2) * (Q(tt, q) * sin(dT(tt)) + I(tt) * cos(dT(tt)))
		+
		((1-f)/2) * p * (p * I(tt) * cos(T(tt)) - Q(tt, q) * sin(T(tt)))
		)
	,
		g * (
		(1-p/2) * (Q(tt, q) * cos(dT(tt)) - I(tt) * sin(dT(tt)))
		-
		((1-f)/2) * p * (I(tt) * sin(T(tt)) + p * Q(tt, q) * cos(T(tt)))
		)
	,
		-tt
	>
#end

#macro Signal()
	ShowParameters()
	#declare tstep = 0.001;
	#declare tmin = 0;
	#declare tmax = 7.8;
	union {
		#declare tcurrent = 0;
		#while (tcurrent < tmax - tstep/2)
			sphere { signal(tcurrent), 0.02 }
			cylinder {
				signal(tcurrent),
				signal(tcurrent + tstep),
				0.02
			}
			#declare tcurrent = tcurrent + tstep;
		#end
		sphere { signal(tcurrent), 0.02 }
		pigment {
			color signalcolor
		}
		finish {
			specular 0.9
			metallic
		}
	}
	mesh {
		#declare tcurrent = 0;
		#while (tcurrent < tmax - tstep/2)
			triangle {
				< 0, 0, -tcurrent         >,
				< 0, 0, -tcurrent - tstep >,
				signal(tcurrent + tstep)
			}
			triangle {
				< 0, 0, -tcurrent         >,
				signal(tcurrent + tstep),
				signal(tcurrent        )
			}
			#declare tcurrent = tcurrent + tstep;
		#end
		pigment {
			color vanecolor
		}
		finish {
			specular 0.9
			metallic
		}
	}
#end

#macro Kurve()
	#declare tstep = 0.01;
	#declare tmin = 0;
	#declare tmax = 7.8;
	union {
		#declare tcurrent = 0;
		#while (tcurrent < tmax - tstep/2)
			sphere { puresignal(tcurrent), 0.025 }
			cylinder {
				puresignal(tcurrent),
				puresignal(tcurrent + tstep),
				0.025
			}
			#declare tcurrent = tcurrent + tstep;
		#end
		sphere { puresignal(tcurrent), 0.025 }
		pigment {
			color rgb<1,0.4,0>
		}
		finish {
			specular 0.9
			metallic
		}
	}
#end
