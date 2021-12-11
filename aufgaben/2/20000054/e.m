#
# e.m -- Entwicklungssatz-Aufgaben
#
# (c) 2020 Prof Dr Andreas Müller, Hochschule Rapperswil
#

n = 5;
N = 10;
bias = 0.2;
zerolevel = 0.3;

function r = rr(N, bias, zerolevel)
	if (rand() < zerolevel)
		r = 0;
	else
		r = round(N * (rand() - bias));
		if (r >= 0)
			r = r + 1;
		end
	end
endfunction

A = zeros(n, n);
c = 0
while (c == 0)
	for i = (1:n)
		for j = (1:n)
			A(i,j) = rr(N, bias, zerolevel);
		end
	end
	c = det(A);
	if (c != 0)
		B = abs(A) == 0;
		h = sum(B, 1);
		v = sum(B, 2);
		if (h < n-1) & (v < n-1)
			c = 0;
		end
	end
end

A
det(A)



