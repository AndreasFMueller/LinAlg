%
% l.m
%
% (c) 2023 Prof Dr Andreas Müller
%
N = 8;

rand("seed", 4711);

function [ A, p, r, p0, r0 ] = gerade(N)
	rest = 1;
	while (rest != 0)
		de = 0
		while (de != 1)
			A = round(2 * N * rand(3,3) - N);
			de = det(A);
			de = de * prod(prod(A != 0));
		end
		r = round(2 * N * rand(3,1) - N);
		p = round(2 * N * rand(3,1) - N);
		p0 = A * p;
		r0 = A * r;
		e1 = [ 1; 0; 0 ];
		n = cross(r0, e1);
		d = dot(p0, cross(r0, e1)) / norm(n);
		rest = d - round(d);
	end
	d
end

[ A, p, r, p0, r0 ] = gerade(N)

