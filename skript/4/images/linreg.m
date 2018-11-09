#
# linreg.m
#
# (c) 2018 Prof Dr Andreas Müller, Hochschule Rapperswil
#
N = 50;
a = 0.5;
b = 1;
x = 12 * rand(N,1) - 0.5;
y = a * x + b + normrnd(0, 0.3, N, 1);

A = x;
A(:,2) = ones(N,1);

v = A \ y;

fn = fopen("linreg.pkt", "w");
for i = (1:50)
	fprintf(fn, "\\p{(%.3f,%.3f)}\n", x(i), y(i));
end

fprintf(fn, "\\begin{scope}\n");
fprintf(fn, "\\clip (-0.5,0) rectangle (11.5,7);\n");
fprintf(fn, "\\draw[color=darkgreen,line width=1.4pt] (%.3f,%.3f)--(%.3f,%.3f);\n",
	-1, -0.5+1, 13, 13*0.5+1);
fprintf(fn, "\\draw[color=red,line width=1.4pt] (%.3f,%.3f)--(%.3f,%.3f);\n",
	-1, -v(1)+v(2), 13, 13*v(1)+v(2));
fprintf(fn, "\\end{scope}\n");
fprintf(fn, "\n");

fclose(fn);


