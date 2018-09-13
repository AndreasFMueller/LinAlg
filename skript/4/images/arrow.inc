//
// arrow.inc
//
// (c) 2018 Prof Dr Andreas Müller, Hochschule Rapperswil
//

#macro arrow(from, to, arrowthickness, c)
        #declare arrowdirection = vnormalize(to - from);
        #declare arrowlength = vlength(to - from);
        union { 
                sphere {
                        from, 1.1 * arrowthickness
                }
                cylinder {
                        from,
                        from + (arrowlength - 5 * arrowthickness) * arrowdirection,                     
                        arrowthickness
                }
                cone {  
                        from + (arrowlength - 5 * arrowthickness) * arrowdirection,                     
                        2 * arrowthickness,
                        to,
                        0
                }
                pigment {
                        color c
                }
                finish {
                        specular 0.9
                        metallic
                }
        }
#end

