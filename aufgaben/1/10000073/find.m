%
% find.m -- find an interesting integer problem
%
% (c) 2022 Prof Dr Andreas Müllelr
%
n = 3;
N = 6;
d = 0;
A0 = diag((1:n));
while (d != 1)
	T = round((rand(n,n) - 0.3 * eye(n)) * N);
	d = det(T);
end

A = T * A0 * inverse(T)

[V, lambda] = eig(A)



