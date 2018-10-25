#
# kreis.m
#
# (c) 2018 Prof Dr Andreas Müller, Hochschule Rapperswil
#
N = 30;
m = [ 5; 3.5];
r = 3;
phi = 2 * pi * rand(N, 1);
R = r + normrnd(0,0.1,N,1);

x = R .* cos(phi) + m(1);
y = R .* sin(phi) + m(2);

A = 2*x;
A(:,2) = 2*y;
A(:,3) = ones(N,1);
b = x.*x + y.*y;

v = A \ b;

fn = fopen("kreis.pkt", "w");
for i = (1:N)
	fprintf(fn, "\\p{(%.3f,%.3f)}\n", x(i), y(i));
end

fprintf(fn, "\\begin{scope}\n");
fprintf(fn, "\\clip (-0.3,0) rectangle (11.5,7);\n");
fprintf(fn, "\\draw[color=darkgreen,line width=1.4pt] (%.3f,%.3f) circle[radius=%.3f];\n",
	m(1), m(2), r);
fprintf(fn, "\\draw[color=red,line width=1.4pt] (%.3f,%.3f) circle[radius=%.3f];\n",
	v(1), v(2), sqrt(v(3) + v(1)^2 + v(2)^2));
fprintf(fn, "\\draw[color=darkgreen,line width=1pt] (%.3f,%.3f) circle[radius=0.08];\n",
	m(1), m(2));
fprintf(fn, "\\draw[color=red,line width=1pt] (%.3f,%.3f) circle[radius=0.08];\n",
	v(1), v(2));
fprintf(fn, "\\end{scope}\n");
fprintf(fn, "\n");

fclose(fn);


