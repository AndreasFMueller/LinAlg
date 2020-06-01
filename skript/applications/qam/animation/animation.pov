//
// animation.pov
//
// (c) 2020 Prof Dr Andreas Müller, Hochschule Rapperswil
//
#version 3.7;
#include "parameters.inc"
#include "scenes.inc"

#declare S = clock;

#if (S < 1)
					ShowAmplitudeModulation(S)
  #else
    #if (S < 2)
					ChangeViewpoint(S - 1)
    #else
      #if (S < 3)
					AMfromRotation(S - 2)
      #else
        #if (S < 4)
					AMSuppressC(S - 3)
        #else
          #if (S < 5)
					AddQ(S - 4)
          #else
            #if (S < 6)
					Modulate2D(S - 5)
            #else
              #if (S < 7)
					Demodulate2D(S - 6)
              #else
                #if (S < 8)
					SuppressC(S - 7)
                #else
                  #if (S < 9)
					SuppressCDemodulated(S - 8)
                  #else
                    #if (S < 10)
					DoFilter(S - 9)
                    #else
                      #if (S <= 11)
					Compensate(S - 10)
                    #end
                  #end
                #end
              #end
            #end
          #end
        #end
      #end
    #end
  #end
#end

#include "common.inc"
#include "signal.inc"
Signal()
Kurve()
