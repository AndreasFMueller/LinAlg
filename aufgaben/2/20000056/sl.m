#
# sl.m -- 3x3-Matrix mit det(A)=1 finden
#
# (c) 2021 Prof Dr Andreas Müller, OST Ostschweizer Fachhochschule
#
wert = -3;
global N;
N = 3;
global l;
l = 5;

function retval = nonzero(x)
	if x == 0
		retval = x + 1;
	else
		retval = x;
	endif
endfunction

function retval = nonzeromatrix(n)
	global	l;
	A = rand(n, n) - 0.5 * eye(n, n);
	A = round((2*l+1) * A);
	for i = (1:n)
		for j = (1:n)
			A(i,j) = nonzero(A(i,j));
		endfor
	endfor
	retval = A;
endfunction

counter = 0
while (counter < 10)
	A = nonzeromatrix(N);
	if (wert == det(A))
		A
		counter = counter + 1;
	endif
endwhile
