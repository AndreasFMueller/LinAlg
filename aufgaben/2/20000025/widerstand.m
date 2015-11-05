source("randoperator.m");

source("kubooktaeder.m");
source("rhombendodekaeder.m");

d = rand(rhombendodekaeder)
z = zyklen(d)
R = eye(size(z)(2))
[A, b] = kirchhoff(z, R, d)
I = A \ b

i1 = I(size(I)(1))

d = rand(kubooktaeder)
z = zyklen(d)
R = eye(size(z)(2))
[A, b] = kirchhoff(z, R, d)
I = A \ b

i2 = I(size(I)(1))

format long e
i1
i2
i1 + i2

