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
				AddQ(S - 2)
      #else
        #if (S < 4)
				Modulate2D(S - 3)
        #else
          #if (S < 5)
				Demodulate2D(S - 4)
          #else
            #if (S < 6)
				SuppressC(S - 5)
            #else
              #if (S < 7)
				SuppressCDemodulated(S - 6)
              #else
                #if (S < 8)
				DoFilter(S - 7)
                #else
                  #if (S <= 9)
				Compensate(S - 8)
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
