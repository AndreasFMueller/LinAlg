%
% l.m -- 
%
% (c) 2023 Prof Dr Andreas Müller
%
N = 8;

rand("seed", 4715);

r = 1;
while (r != 0)
	A = round(2 * N * rand(3,4) - N);
	for i = (1:3)
		for j = (1:4)
			if (A(i,j) >= 0)
				A(i,j) = A(i,j) + 1;
			end
		end
	end
	n1 = cross(A(:,1), A(:,2));
	n2 = cross(A(:,3), A(:,4));
	n = cross(n1, n2);
	if (norm(n) == 0)
		r = 1;
	else
		n1norm = norm(n1);
		n2norm = norm(n2);
		r = hypot(n1norm - floor(n1norm), n2norm - floor(n2norm));
	end
end

A
n1
n1norm
n2
n2norm
n = cross(n1, n2)
n / 18
norm(n / 18)
sinalpha = norm(n) / (n1norm * n2norm)
