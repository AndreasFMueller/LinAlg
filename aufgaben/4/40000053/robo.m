v0 = 0.2
s0 = 4
c = 1
t = [0;1;2]
tau = (s0 + v0 * t) / (c - v0)
e = 0.2

T = t + 2 * tau

Tr = round(100 * (T + e * rand(3,1)))/100

A = ones(3,2)
A(:,2) = (Tr + t)/2
b = (Tr - t)/(2 * c)

A \ b

A' * A

A' * b
