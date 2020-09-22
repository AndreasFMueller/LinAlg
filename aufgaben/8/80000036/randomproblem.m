#
# randomproblem.m
#
# (c) 2020 Prof Dr Andreas Müller, Hochschule Rapperswil
#

function v = randomeigenvalue(limit)
	lambda = 0;
	do
		lambda = round(2 * limit * (rand() - 0.5));
	until (abs(lambda) > 1)
	v = lambda;
endfunction

found = 0;

do
	T = round(20 * (rand(3, 3) - 0.5 * ones(3,3)));
	if (T == eye(3))
		continue;
	endif
	if (det(T) != 1) 
		continue;
	endif
	for lambda = (-7:2:7)
		if (lambda == 0)
			continue;
		endif
		A = lambda * eye(3);
		A0 = A;
		A(1,2) = 1;
		A0(2,3) = 1;
		B = T * A * inverse(T);
		if (B == A0)
			continue;
		endif

		# count the number of zeros
		counter = 0;
		for i = (1:3)
			for j = (1:3)
				if (B(i,j) == 0) 
					counter = counter + 1;
				endif
			endfor
		endfor
		counter;
		if (counter != 2) 
			continue;
		endif
		lambda
		A
		T
		B
		[V, lambda] = eig(B)
		found = found + 1
	endfor
until (found > 100)

