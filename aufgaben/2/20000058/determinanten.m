%
% determinanten.m -- find determinante problems
%
% (c) 2023 Prof Dr Andreas Müller
%
global N;
N = 10;
rand("seed", 4711);

function retval = testmatrix(A, wert)
	retval = 0;
	if (det(A) != wert)
		return
	end
	if (sum(sum((A == 0), 1) == 3))
		retval = 0;
		return
	end
	if (sum(sum((A == 0), 2) == 3))
		retval = 0;
		return
	end
	if (sum(sum((A == 0), 1) == 2))
		retval = 1;
	end
	if (sum(sum((A == 0), 2) == 2))
		retval = 1;
	end
end

function retval = create(n)
	global N;
	A = round(2 * N * rand(n, n) - N);
	retval = A;
end

function retval = findmatrix(n, wert)
	found = 0;
	while (found == 0)
		A = create(4);
		if (testmatrix(A, wert) > 0)
			found = 1;
		end
	end
	retval = A;
end

function writedet(fn, gn, A)
	fprintf(fn, "\\begin{pmatrix}\n");
	for i = (1:4)
		if (i > 1)
			fprintf(fn, " \\\\\n");
		end
		fprintf(fn, "%4d & %4d & %4d & %4d ",
			A(i, 1), A(i, 2), A(i, 3), A(i, 4));
	end
	fprintf(fn, "\n\\end{pmatrix}\n");

	fprintf(gn, "A = [\n");
	for i = (1:4)
		if (i > 1)
			fprintf(gn, ";\n");
		end
		fprintf(gn, "\t%4d, %4d, %4d, %4d",
			A(i, 1), A(i, 2), A(i, 3), A(i, 4));
	end
	fprintf(gn, "\n];\n");
end

fn = fopen("determinanten.tex", "w");
gn = fopen("d.m", "w");
for jahr = (2024:2027)
	A = findmatrix(4, jahr)
	writedet(fn, gn, A);
end
fclose(fn);
fclose(gn);

