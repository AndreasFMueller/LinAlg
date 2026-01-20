%
% l.m
%
% (c) 2023 Prof Dr Andreas Müller
%
N = 5;

rand("seed", 4711)

function retval = sl2matrix(N)
	d = 0;
	while (d != 1)
		A = round(2 * N * rand(2,2) - N);
		for i = (1:2)
			for j = (1:2)
				if (A(i,j) >= 0)
					A(i,j) = A(i,j) + 1;
				end
			end
		end
		d = det(A);
	end
	retval = A;
end

function retval = randev(N)
	retval = round(2 * N * rand(2,2) - N);
	for i = (1:2)
		if (retval(i,i) >= 0)
			retval(i,i) = retval(i,i) + 1;
		end
	end
	if (retval(1,1) == retval(2,2))
		retval(2,2) = retval(1,1) + 1;
	end
	retval(1,2) = 1;
	retval(2,1) = 0;
end

function schreibeaufgabe(fn, A, p, lambda)
	fprintf(fn, "Ist die Matrix\n");
	fprintf(fn, "\\[\n");
	fprintf(fn, "A = \\begin{pmatrix*}[r]\n");
	fprintf(fn, "%5d & %5d \\\\\n", A(1,1), A(1,2));
	fprintf(fn, "%5d & %5d \n", A(2,1), A(2,2));
	fprintf(fn, "\\end{pmatrix*}\n");
	fprintf(fn, "\\]\n");
	fprintf(fn, "diagonalisierbar? Wenn ja, finden Sie eine Basis, in\n");
	fprintf(fn, "der $A$ diagonal wird.\n");
	fprintf(fn, "\n");

	fprintf(fn, "\\begin{loesung}\n");
	fprintf(fn, "Wir bestimmen zunächst das charakteristische Polynom\n");
	fprintf(fn, "mit Hilfe der Determinante:\n");
	fprintf(fn, "\\[\n");
	fprintf(fn, "\\det (A-\\lambda I)\n");
	fprintf(fn, "=\n");
	fprintf(fn, "\\left|\\,\\begin{matrix*}[r]\n");
	fprintf(fn, "%d - \\lambda & %d\\\\\n", A(1,1), A(1,2));
	fprintf(fn, "%d & %d - \\lambda\n", A(2,1), A(2,2));
	fprintf(fn, "\\end{matrix*}\\,\\right|\n");
	fprintf(fn, "=\n");
	fprintf(fn, "(%d-\\lambda)(%d-\\lambda)-(%d)(%d)\n",
		A(1,1), A(2,2), A(1,2), A(2,1));
	fprintf(fn, "=\n");
	s1 = "+";
	if (p(1,2) < 0) 
		s1 = "-";
	end
	s2 = "+";
	if (p(1,3) < 0)
		s2 = "-";
	end
	fprintf(fn, "\\lambda^2 %c %d \\lambda %c %d\n",
		s1, abs(p(1,2)), s2, abs(p(1,3)));
	fprintf(fn, "=\n");
	s1 = "+";
	if (lambda(1,1) > 0)
		s1 = "-";
	end
	s2 = "+";
	if (lambda(2,2) > 0)
		s2 = "-";
	end
	fprintf(fn, "(\\lambda %c %d)(\\lambda %c %d).\n",
		s1, abs(lambda(1,1)), s2, abs(lambda(2,2)));
	fprintf(fn, "\\]\n");
	fprintf(fn, "Daraus kann man die Eigenwerte $\\lambda_1=%d$ und ",
		lambda(1,1));
	fprintf(fn, "$\\lambda_2=%d$ ablesen.\n", lambda(2,2));
	fprintf(fn, "Für jeden dieser Eigenwerte ist jetzt der Gauss-Algorithmus\n");
	fprintf(fn, "durchzuführen, dazu bilden wir die Tableaux\n");
	fprintf(fn, "\\begin{align*}\n");
	fprintf(fn, "\\lambda_1&=%d:\n", lambda(1,1));
	fprintf(fn, "&\n");
	fprintf(fn, "\\begin{tabular}{|>{$}r<{$}>{$}r<{$}|>{$}r<{$}|}\n");
	fprintf(fn, "\\hline\n");
	G = A - lambda(1,1) * eye(2);
	fprintf(fn, " %5d & %5d & 0 \\\\\n", G(1,1), G(1,2));
	fprintf(fn, " %5d & %5d & 0 \\\\\n", G(2,1), G(2,2));
	fprintf(fn, "\\hline\n");
	fprintf(fn, "\\end{tabular}\n");
	fprintf(fn, "&\\to\n");
	fprintf(fn, "\\begin{tabular}{|>{$}r<{$}>{$}r<{$}|>{$}r<{$}|}\n");
	fprintf(fn, "\\hline\n");
	fprintf(fn, " 1 & \\frac{%d}{%d} & 0 \\\\\n", G(1,2), G(1,1));
	fprintf(fn, " 0 & 0 & 0 \\\\\n");
	fprintf(fn, "\\hline\n");
	fprintf(fn, "\\end{tabular}\n");
	fprintf(fn, "&&\\Rightarrow\n");
	fprintf(fn, "&v_1&=\n");
	fprintf(fn, "\\begin{pmatrix*}[r]\n");
	fprintf(fn, "%d\\\\%d\n", -G(1,2), G(1,1));
	fprintf(fn, "\\end{pmatrix*},\n");
	fprintf(fn, "\\\\\n");
	fprintf(fn, "\\lambda_2&=%d:\n", lambda(2,2));
	fprintf(fn, "&\n");
	fprintf(fn, "\\begin{tabular}{|>{$}r<{$}>{$}r<{$}|>{$}r<{$}|}\n");
	fprintf(fn, "\\hline\n");
	G = A - lambda(2,2) * eye(2);
	fprintf(fn, " %5d & %5d & 0 \\\\\n", G(1,1), G(1,2));
	fprintf(fn, " %5d & %5d & 0 \\\\\n", G(2,1), G(2,2));
	fprintf(fn, "\\hline\n");
	fprintf(fn, "\\end{tabular}\n");
	fprintf(fn, "&\\to\n");
	fprintf(fn, "\\begin{tabular}{|>{$}r<{$}>{$}r<{$}|>{$}r<{$}|}\n");
	fprintf(fn, "\\hline\n");
	fprintf(fn, " 1 & \\frac{%d}{%d} & 0 \\\\\n", G(1,2), G(1,1));
	fprintf(fn, " 0 & 0 & 0 \\\\\n");
	fprintf(fn, "\\hline\n");
	fprintf(fn, "\\end{tabular}\n");
	fprintf(fn, "&&\\Rightarrow\n");
	fprintf(fn, "&v_2&=\n");
	fprintf(fn, "\\begin{pmatrix*}[r]\n");
	fprintf(fn, "%d\\\\%d\n", -G(1,2), G(1,1));
	fprintf(fn, "\\end{pmatrix*}.\n");
	fprintf(fn, "\\end{align*}\n");
	fprintf(fn, "Die Vektoren $v_1$ und $v_2$ sind linear unabhängige ");
	fprintf(fn, "Eigenvektoren,\n");
	fprintf(fn, "somit können sie als Basis verwendet\n");
	fprintf(fn, "werden, in der $A$ diagonal wird.\n");
	fprintf(fn, "\\end{loesung}\n");
	fprintf(fn, "\n");
	fprintf(fn, "\\begin{bewertung}\n");
	fprintf(fn, "Charakteristisches Polynom ({\\bf X}) 2 Punkte,\n");
	fprintf(fn, "Eigenwerte ({\\bf E}) 1 Punkt,\n");
	fprintf(fn, "Gauss-Algorithmus und Eigenvektoren ({\\bf G}) 2 Punkte (je ein Punkt\n");
	fprintf(fn, "für jeden Eigenvektor,\n");
	fprintf(fn, "Diagonalisierbarkeit ({\\bf D}) 1 Punkt.\n");

	fprintf(fn, "\\end{bewertung}\n")
	fprintf(fn, "\n");
	fprintf(fn, "\n");
	fprintf(fn, "\n");
end

fn = fopen("evaufgaben.tex", "w");

for i = (2024:2027)
	filename = sprintf("ev%d.tex", i);
	fn = fopen(filename, "w");
	T = sl2matrix(N);
	A0 = randev(N);
	A = T * A0 * inverse(T)
	charpoly = poly(A)
	[V, lambda] = eig(A)
	schreibeaufgabe(fn, A, charpoly, lambda);
	fclose(fn);
end

