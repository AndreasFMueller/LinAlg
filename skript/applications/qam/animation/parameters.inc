//
// parameters.inc
//
// (c) 2020 Prof Dr Andreas Müller, Hochschule Rapperswil
//
#declare R = 1.4;

#declare OmegaLimit = 20 * pi;

#declare Omega = 0;
#declare dOmega = 0;

// make Q(t) disappear when q = 0
#declare q = 1;
// suppress the c(t) signal if p = 1 (project onto I)
#declare p = 1;
// filter 2omega component when f = 1
#declare f = 0.9;
// final gain adjustment
#declare g = 2;

#macro DefaultParameters()
	#declare q = 1;
	#declare p = 0;
	#declare f = 0;
	#declare g = 1;
	#declare Omega = 0;
	#declare dOmega = 0;
#end

#macro ShowParameters()
#debug concat("Omega =  ", str(Omega,10,5), "\n")
#debug concat("dOmega = ", str(dOmega,10,5), "\n")
#debug concat("p =      ", str(p,10,5), "\n")
#debug concat("q =      ", str(q,10,5), "\n")
#debug concat("f =      ", str(f,10,5), "\n")
#debug concat("g =      ", str(g,10,5), "\n")
#end

#declare vanecolor = rgbf<0, 0.8, 0.8, 0.5>;
#declare signalcolor = rgb<0.6, 0.2, 0.8>;

// Animation
//
// 1. show amplitude modulation:
//    q = 0, p = 1, increase Omega from 0 to a large number
//
// 2. add Q
//    p = 0, Omega = 0, increase q from 0 to 1
//
// 3. Modulate a 2d signal
//    p = 0, q = 1, increase Omega from 0 to a large number
//
// 4. Demodulate the modulated signal
//    p = 0, 1 = 1, Omega = large, decrease dOmage from 0 to the large number
//
// 5. Suppress c(t)
//    increase p from 0 to 1
//    
// 6. Filter high frequency components
//
//
// 7. Compensate loss of gain
//    increase 



