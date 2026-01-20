%
% least squares Pade approximation
%
% (c) 2023 Prof Dr Andreas Müller
%
N = 3;

global a;
global b;

s = 4711;
rand("seed", s);
randn("seed", s);

a = 1;
b = 2;

function y = f(x)
	global a;
	global b;
	y = a * x / (x - b);
end

function d = generate(N,limit)
	m = 1000;
	while (m > limit)
		x = 4 * rand(1,N);
		y = zeros(1,N);
		for i = (1:N)
			y(1,i) = f(x(1,i));
		end
		m = max(abs(y));
	end
	y = y + 0.1 * randn(1,N);
	d = zeros(N, 3);
	d(:,1) = (1:N);
	d(:,2) = x';
	d(:,3) = y';
end

d = generate(N, 4)

A = zeros(N, 2);
B = zeros(N, 1);
for i = (1:N)
	A(i,1) = d(i,2);
	A(i,2) = d(i,3);
	B(i,1) = d(i,3) * d(i,2);
end

A
B

M = A'*A
r = A'*B

A \ B

inverse(M) * r

N = 100;
d = generate(N,100);
A = zeros(N, 2);
b = zeros(N, 1);
for i = (1:N)
	A(i,1) = d(i,2);
	A(i,2) = d(i,3);
	B(i,1) = d(i,3) * d(i,2);
end
p = A \ B

fn = fopen("punkte.tex", "w");
fprintf(fn, "\\def\\punkte{\n");
for i = (1:N)
	fprintf(fn, "\\punkt{%.4f}{%.4f}\n", d(i,2), d(i,3));
end
fprintf(fn, "}\n");

fprintf(fn, "\\def\\kurven{\n");
fprintf(fn, "\\draw[color=darkgreen,line width=1.4pt] ");
fprintf(fn, "plot[domain=0:%.4f,samples=100] ", p(2,1)-0.1);
fprintf(fn, "({\\dx*\\x},{%.4f*\\x/(\\x-%.4f)});\n", p(1,1), p(2,1));
fprintf(fn, "\\draw[color=darkgreen,line width=1.4pt] ");
fprintf(fn, "plot[domain=%.4f:4,samples=100] ", p(2,1)+0.1);
fprintf(fn, "({\\dx*\\x},{%.4f*\\x/(\\x-%.4f)});\n", p(1,1), p(2,1));
fprintf(fn, "\\draw[color=darkgreen] ({%.4f*\\dx},-10) -- ({%.4f*\\dx},10);\n",
	p(2,1), p(2,1));
fprintf(fn, "}\n");
fclose(fn);
