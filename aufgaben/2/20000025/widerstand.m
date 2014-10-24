source("randoperator.m");
source("oktaeder.m");
d = rand(oktaeder)
z = zyklen(d)
R = eye(size(z)(2))
A = kirchhoff(z, R, d)

