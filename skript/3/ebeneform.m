p = round(10 * rand(1,3) - 5 * ones(1,3))
u = round(10 * rand(1,3) - 5 * ones(1,3))
v = round(10 * rand(1,3) - 5 * ones(1,3))

A = zeros(3,5);
A(1,1:3) = p
A(2,1:3) = p+u
A(3,1:3) = p+v
A(1:3,4) = -ones(3,1)

rref(A)

