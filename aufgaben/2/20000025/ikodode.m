source("randoperator.m");

source("ikosaeder.m");
source("dodekaeder.m");

d = rand(dodekaeder)
z = zyklen(d)
R = eye(size(z)(2))
[A, b] = kirchhoff(z, R, d)
I = A \ b

i1 = I(size(I)(1))

d = rand(ikosaeder)
z = zyklen(d)
R = eye(size(z)(2))
[A, b] = kirchhoff(z, R, d)
I = A \ b

i2 = I(size(I)(1))

format long e
i1
i2
i1 + i2

