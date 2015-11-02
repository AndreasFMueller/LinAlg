source("randoperator.m");

source("oktaeder.m");
source("ikosaeder.m");
source("dodekaeder.m");
source("hexaeder.m");
source("tetraeder.m");
source("kubooktaeder.m");
source("rhombendodekaeder.m");

d = rand(kubooktaeder)
z = zyklen(d)
R = eye(size(z)(2));
[A, b] = kirchhoff(z, R, d)
I = A \ b
1 / I(size(I)(1)) - 1

d = rand(rhombendodekaeder)
z = zyklen(d)
R = eye(size(z)(2));
[A, b] = kirchhoff(z, R, d)
I = A \ b
1 / I(size(I)(1)) - 1

