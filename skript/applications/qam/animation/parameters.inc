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
#declare enableq = 1;
// suppress the c(t) signal if p = 1 (project onto I)
#declare project = 1;
// filter 2omega component when f = 1
#declare enablefilter = 0.9;
// final gain adjustment
#declare gain = 2;
// change from top view (viewpoint = 1) to perspective view by (viewpoint = 0)
#declare viewpoint = 0;

#macro DefaultParameters()
	#declare enableq = 1;
	#declare project = 0;
	#declare enablefilter = 0;
	#declare gain = 1;
	#declare Omega = 0;
	#declare dOmega = 0;
	#declare viewpoint = 0;
#end

#macro ShowParameters()
#debug concat("Omega =        ", str(Omega,        10, 5), "\n")
#debug concat("dOmega =       ", str(dOmega,       10, 5), "\n")
#debug concat("project =      ", str(project,      10, 5), "\n")
#debug concat("enableq =      ", str(enableq,      10, 5), "\n")
#debug concat("enablefilter = ", str(enablefilter, 10, 5), "\n")
#debug concat("gain =         ", str(gain,         10, 5), "\n")
#debug concat("viewpoint =    ", str(viewpoint,    10, 5), "\n")
#end

#declare vanecolor = rgbf<0, 0.8, 0.8, 0.5>;
#declare signalcolor = rgb<0.6, 0.2, 0.8>;

// Animation
//
// 1. show amplitude modulation:
//    enableq = 0, project = 1, increase Omega from 0 to a large number
//
// 2. add Q
//    project = 0, Omega = 0, increase enableq from 0 to 1
//
// 3. Modulate a 2d signal
//    project = 0, enableq = 1, increase Omega from 0 to a large number
//
// 4. Demodulate the modulated signal
//    project = 0, enableq = 1, Omega = large,
//    decrease dOmega from 0 to the large number
//
// 5. Suppress c(t)
//    increase project from 0 to 1
//    
// 6. Filter high frequency components
//
//
// 7. Compensate loss of gain
//    increase gain from 1 to 2
//


