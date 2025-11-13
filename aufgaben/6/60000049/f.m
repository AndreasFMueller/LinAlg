%
% f.m
%
% (c) 2025 Prof Dr Andreas Müller
%
global N;
N = 50;

rand("seed", 4711)

function retval = findtracezero()
	global N;
	d = 1;
	while (d != 0)
		A = round(N * (rand(3,3) - 0.5 * ones(3,3)));
		m = prod(prod(A)) * det(A);
		if (m != 0)
			d = trace(A);
		end
	end
	retval = A;
end

for i = (1:10)
	A = findtracezero()
end

