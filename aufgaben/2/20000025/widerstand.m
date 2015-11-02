source("randoperator.m");
source("kubooktaeder.m");
d = rand(kubooktaeder)
z = zyklen(d)
R = eye(size(z)(2))
A = kirchhoff(z, R, d)

