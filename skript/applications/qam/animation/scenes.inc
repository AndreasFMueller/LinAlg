//
// scenes.inc
//
// (c) 2020 Prof Dr Andreas Müller
//

//
// slew function used for animations
//
#declare stufe = function(s) { (abs(s-0.1)/(0.8)+abs(s-0.9)/(-0.8)+1)/2 }
#declare slew = function(s) { (1 - cos(stufe(s) * pi)) / 2 }

#macro ShowAmplitudeModulation(s)
	#debug concat("ShowAmplitudeModulation(" , str(s,7,4), ")\n")
	DefaultParameters()
	#declare viewpoint = 1;
	#declare enableq = 0;
	#declare project = 1;
	#declare Omega = slew(s) * OmegaLimit;
#end

#macro ChangeViewpoint(s)
	#debug concat("ChangeViewpoint(" , str(s,7,4), ")\n")
	DefaultParameters()
	#declare enableq = 0;
	#declare project = 1;
	#declare viewpoint = slew(1-s);
#end

#macro AMfromRotation(s)
	#debug concat("AMfromRotation(" , str(s,7,4), ")\n")
	DefaultParameters()
	#declare viewpoint = 0;
	#declare enableq = 0;
	#declare project = 0;
	#declare Omega = slew(s) * OmegaLimit;
#end

#macro AMSuppressC(s)
	#debug concat("AMSupressC(" , str(s,7,4), ")\n")
	DefaultParameters()
	#declare viewpoint = 0;
	#declare enableq = 0;
	#declare project = slew(s);
	#declare Omega = OmegaLimit;
#end

#macro AddQ(s)
	#debug concat("AddQ(" , str(s,7,4), ")\n")
	DefaultParameters()
	#declare enableq = slew(s);
#end

#macro Modulate2D(s)
	#debug concat("Modulate2D(" , str(s,7,4), ")\n")
	DefaultParameters()
	#declare Omega = slew(s) * OmegaLimit;
#end

#macro Demodulate2D(s)
	#debug concat("Demodulate2D(" , str(s,7,4), ")\n")
	DefaultParameters()
	#declare Omega = OmegaLimit;
	#declare dOmega = slew(s) * OmegaLimit;
#end

#macro SuppressC(s)
	#debug concat("SuppressC(" , str(s,7,4), ")\n")
	DefaultParameters()
	#declare Omega = OmegaLimit;
	#declare project = slew(s);
#end

#macro SuppressCDemodulated(s)
	#debug concat("SuppressCDemodulated(" , str(s,7,4), ")\n")
	DefaultParameters()
	#declare Omega = OmegaLimit;
	#declare dOmega = OmegaLimit;
	#declare project = slew(s);
#end

#macro DoFilter(s)
	#debug concat("DoFilter(" , str(s,7,4), ")\n")
	DefaultParameters()
	#declare Omega = OmegaLimit;
	#declare dOmega = OmegaLimit;
	#declare project = 1;
	#declare enablefilter = slew(s);
#end

#macro Compensate(s)
	#debug concat("Compensate(" , str(s,7,4), ")\n")
	DefaultParameters()
	#declare Omega = OmegaLimit;
	#declare dOmega = OmegaLimit;
	#declare project = 1;
	#declare enablefilter = 1;
	#declare gain = 1 + slew(s);
#end

