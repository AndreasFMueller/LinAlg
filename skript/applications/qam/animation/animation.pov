//
// animation.pov
//
// (c) 2020 Prof Dr Andreas Müller, Hochschule Rapperswil
//
#version 3.7;
#include "parameters.inc"
#include "common.inc"
#include "scenes.inc"

#declare S = clock;

#if (S < 1)
	ShowAmplitudeModulation(S)
#else
#if (S < 2)
	AddQ(S - 1)
#else
#if (S < 3)
	Modulate2D(S - 2)
#else
#if (S < 4)
	Demodulate2D(S - 3)
#else
#if (S < 5)
	SuppressC(S - 4)
#else
#if (S < 6)
	SuppressCDemodulated(S - 5)
#else
#if (S < 7)
	DoFilter(S - 6)
#else
#if (S <= 8)
	Compensate(S - 7)
#end
#end
#end
#end
#end
#end
#end
#end

#include "signal.inc"
Signal()
Kurve()
