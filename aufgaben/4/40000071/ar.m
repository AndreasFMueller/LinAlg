%
% ar.m -- autoregressive model
%
% (c) 2023 Prof Dr Andreas Müller
%
s = 4711;
e = 0.02;
rand("seed", s);
randn("seed", s);
n = 5;
k = 2;
theta = [ -1, 0 ];

fn = fopen("ar.tex", "w");

x = zeros(1,n);
x(1,(1:2)) = rand(1,2);

fprintf(fn, "\\def\\xone{%.4f}\n", x(1,1));
fprintf(fn, "\\def\\xtwo{%.4f}\n", x(1,2));

for i = (3:n)
	x(1,i) = theta * x(1,[i-2,i-1])';
end
x = x + e * randn(1,n);
x

fprintf(fn, "\\def\\xwerte{\n");
for i = (1:n)
	if (i > 1)
		fprintf(fn, ",\\quad ");
	end
	fprintf(fn, "%.4f", x(1,i));
end
fprintf(fn, "\n}\n");

A = zeros(n-k,k);
for i = (1:k)
	A(:,k+1-i) = round(10000*x(1,(i:i+n-k-1))')/10000;
end
A

fprintf(fn, "\\def\\Amatrix{\n");
fprintf(fn, "\\begin{pmatrix*}[r]\n");
for i = (1:(n-k))
	if (i > 1)
		fprintf(fn, "\\\\\n");
	end
	for j = (1:k)
		if (j > 1)
			fprintf(fn, " & ");
		end
		fprintf(fn, " %.4f ", A(i, j));
	end
end
fprintf(fn, "\n\\end{pmatrix*}\n");
fprintf(fn, "}\n");

b = round(10000*x(1,(k+1:n))')/10000

fprintf(fn, "\\def\\bvector{\n");
fprintf(fn, "\\begin{pmatrix*}[r]\n");
for i = (1:(n-k))
	if (i > 1)
		fprintf(fn, "\\\\\n");
	end
	fprintf(fn, " %.4f ", b(i, 1));
end
fprintf(fn, "\n\\end{pmatrix*}\n");
fprintf(fn, "}\n");

M = A'*A
fprintf(fn, "\\def\\Mmatrix{\n");
fprintf(fn, "\\begin{pmatrix*}[r]\n");
for i = (1:2)
	if (i > 1)
		fprintf(fn, "\\\\\n");
	end
	for j = (1:2)
		if (j > 1)
			fprintf(fn, " & ");
		end
		fprintf(fn, " %.4f ", M(i, j));
	end
end
fprintf(fn, "\n\\end{pmatrix*}\n");
fprintf(fn, "}\n");

r = A'*b
fprintf(fn, "\\def\\rvector{\n");
fprintf(fn, "\\begin{pmatrix*}[r]\n");
for i = (1:2)
	if (i > 1)
		fprintf(fn, "\\\\\n");
	end
	fprintf(fn, " %.4f ", r(i, 1));
end
fprintf(fn, "\n\\end{pmatrix*}\n");
fprintf(fn, "}\n");

thetaneu = A \ b
fprintf(fn, "\\def\\thetavector{\n");
fprintf(fn, "\\begin{pmatrix*}[r]\n");
for i = (1:2)
	if (i > 1)
		fprintf(fn, "\\\\\n");
	end
	fprintf(fn, " %.4f ", thetaneu(i, 1));
end
fprintf(fn, "\n\\end{pmatrix*}\n");
fprintf(fn, "}\n");

fclose(fn);
