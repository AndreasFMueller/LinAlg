#
# randomproblem
#
function v = randomeigenvalue(limit)
	lambda = 0;
	do
		lambda = round(2 * limit * (rand() - 0.5));
	until (abs(lambda) > 1)
	v = lambda
endfunction

lambda = randomeigenvalue(7)
do
	nu = randomeigenvalue(7);
until (lambda != nu)
nu

A = zeros(3, 3);
A(1,1) = lambda;
A(1,2) = 1;
A(2,2) = lambda;
A(3,3) = nu;
A

T = eye(3);
do
	T0 = round(20 * (rand(2, 2) - 0.5 * ones(2,2)));
	T(1:2,1:2) = T0;
until (1 == det(T))

B = T*A*inverse(T)

[V, lambda] = eig(B)

