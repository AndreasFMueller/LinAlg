phi = (1 + sqrt(5))/2
B1 = [
   1,    phi, 1/phi;
   1, -1/phi,     0;
   1,      0,   phi
]

B2 = [
   1/phi,     0, -1/phi;
       0,  -phi,      0;
     phi, 1/phi,    phi
]

inverse(B1)

R = B2 * inverse(B1)

R' * R

45 * acos((trace(R)-1)/2) / atan(1)
