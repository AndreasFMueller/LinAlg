#
# e.m
#
# (c) 2020 Prof Dr Andreas Müller, Hochschule Rapperswil 
#

A = [ -2, 0; 0, 5 ];
global n;
n = 2;

function retval = r(minimum, maximum)
	retval = round((maximum - minimum - 1) * rand()) + minimum;
	if (retval >= 0)
		retval = retval + 1;
	end
end

function retval = matrix(minimum, maximum)
	global n;
	A = zeros(n, n);
	for i = (1:n)
		for j = (1:n)
			A(i,j) = r(minimum, maximum);
		end
	end
	retval = A;
end

d = 0;
while (d == 0)
	T = matrix(-3, 9);
	d = det(T);
	if (d != 1)
		d = 0;
	end
end

det(T)
T
inverse(T)
T * A * inverse(T)
A

