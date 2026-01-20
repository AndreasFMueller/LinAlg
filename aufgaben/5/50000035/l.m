%
% l.m -- find a plane and a point with integer distance
%
% (c) 2023 Prof Dr Andreas Müller
%
N = 10;

rand("seed", 4711);

r = 1;
while (r != 0)
	A = round(2 * N * rand(3,3) - N);
	b = round(2 * N * rand(3,1) - N);
	for i = (1:3)
		for j = (1:3)
			if (A(i,j) >= 0)
				A(i,j) = A(i,j) + 1;
			end
		end
	end
	d = det(A);
	n = cross(A(:,1), A(:,2));
	d = dot(n, b - A(:,3)) / norm(n);
	r = d - round(d);
end

A
b
n
d
