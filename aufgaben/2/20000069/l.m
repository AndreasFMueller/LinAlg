%
% l.m
%
% (c) 2025 Prof Dr Andreas Müller
%
l = 8;
n = 4;

d = 0;
D = 0;
while ((d != (n-1)) || (D < 5))
	A = round(2 * l * rand(n, n) - 2 * l * zeros(n, n));
	A = (A > 0) .* A;
	% count zeros
	a = A == 0;
	d = max([ max(sum(a, 1)), max(sum(a, 2)) ]);
	D = sum(sum(a));
	A;
end

A
det(A)
