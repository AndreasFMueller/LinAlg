%
% l.m -- create problem
%
% (c) 2025 Prof Dr Andreas Müller
%
n = 3;
l = 7;

rand("seed", 4712)

d = 0;
while d == 0
	A = round(2 * l * rand(n, n) - l * ones(n, n));
	for i = (2:n)
		for k = (1:i-1)
			A(i,k) = 0;
		end
	end
	B = round(2 * l * rand(n, n) - l * ones(n, n));
	for i = (1:n-1)
		for k = (i+1:n)
			B(i,k) = 0;
		end
	end
	d = det(A) * det(B);
end
A
det(A)
B
det(B)
C = A * B
det(C)
