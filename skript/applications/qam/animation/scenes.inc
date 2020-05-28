//
// scenes.inc
//
// (c) 2020 Prof Dr Andreas Müller
//

#macro ShowAmplitudeModulation(s)
	#debug concat("ShowAmplitudeModulation(" , str(s,7,4), ")\n")
	DefaultParameters()
	#declare q = 0;
	#declare p = 1;
	#declare Omega = slew(s) * OmegaLimit;
#end

#macro AddQ(s)
	#debug concat("AddQ(" , str(s,7,4), ")\n")
	DefaultParameters()
	#declare q = slew(s);
#end

#macro Modulate2D(s)
	#debug concat("Modulate2D(" , str(s,7,4), ")\n")
	#declare Omega = slew(s) * OmegaLimit;
#end

#macro Demodulate2D(s)
	#debug concat("Demodulate2D(" , str(s,7,4), ")\n")
	#declare Omega = OmegaLimit;
	#declare dOmega = slew(s) * OmegaLimit;
#end

#macro SuppressC(s)
	#debug concat("SuppressC(" , str(s,7,4), ")\n")
	DefaultParameters()
	#declare Omega = OmegaLimit;
	#declare p = slew(s);
#end

#macro SuppressCDemodulated(s)
	#debug concat("SuppressCDemodulated(" , str(s,7,4), ")\n")
	DefaultParameters()
	#declare Omega = OmegaLimit;
	#declare dOmega = OmegaLimit;
	#declare p = slew(s);
#end

#macro DoFilter(s)
	#debug concat("DoFilter(" , str(s,7,4), ")\n")
	DefaultParameters()
	#declare Omega = OmegaLimit;
	#declare dOmega = OmegaLimit;
	#declare p = 1;
	#declare f = slew(s);
#end

#macro Compensate(s)
	#debug concat("Compensate(" , str(s,7,4), ")\n")
	DefaultParameters()
	#declare Omega = OmegaLimit;
	#declare dOmega = OmegaLimit;
	#declare p = 1;
	#declare f = 1;
	#declare g = 1 + slew(s);
#end

