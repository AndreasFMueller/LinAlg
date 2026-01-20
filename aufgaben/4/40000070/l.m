%
% l.m
%
% (c) 2023 Prof Dr Andreas Müller
%
s = 4711;
rand("seed", s);
randn("seed", s);

e = 0.1;
N = 100;
global a = [ 1, 1, 1 ]
n = 2;
global b = [ 1, -6, 11, -6 ];
m = 3;

function y = f(x)
	global a;
	global b;
	y = polyval(a, x) / polyval(b, x);
end

x = 4 * rand(N,1);
y = zeros(N,1);
for i = (1:N)
	y(i,1) = f(x(i,1));
end
y = y + e * randn(N, 1)

k = n + m + 1;

A = zeros(N, k);
A(:,1) = ones(N,1);
A(:,2) = x(:,1);
A(:,3) = x(:,1).^2;
A(:,4) = -y(:,1);
A(:,5) = -y(:,1).*x(:,1);
A(:,6) = -y(:,1).*x(:,1).^2;
A

b = x(:,1).^m .* y(:,1);

A \ b

M = A'*A
r = A'*b

p = inverse(M)*r

% find zeros
bpoly = [ 1, p(6,1), p(5,1), p(4,1) ];
nullstellen = sort(roots(bpoly))

global anew;
anew = [ p(3,1), p(2,1), p(1,1) ]
global bnew;
bnew = [ 1, p(6,1), p(5,1), p(4,1) ]

function kurve(fn, von, bis)
	global	anew;
	global	bnew;
	npunkte = 50;
	fprintf(fn, "%% Intervall %.4f bis %.4f\n", von, bis);
	fprintf(fn, "	\\draw[color=#1,line width=1.4pt] ");
	x = von + (bis - von) * (1:(npunkte-1)) / npunkte;
	for i = (1:(npunkte-1))
		if (i > 1)
			fprintf(fn, "\n\t-- ");
		end
		wert = polyval(anew, x(i)) / polyval(bnew, x(i));
		fprintf(fn, " ({\\dx*(%.4f)},{\\dy*(%.4f)})", x(i), wert);
	end
	fprintf(fn, ";\n");
end

fn = fopen("punkte.tex", "w");
fprintf(fn, "\\def\\punkte{\n");
for i = (1:N)
	fprintf(fn, "\\punkt{%.4f}{%.4f}\n", x(i,1), y(i,1));
end
fprintf(fn, "}\n");
fprintf(fn, "\\def\\kurven#1{\n");
for i = (1:3)
	fprintf(fn, "\\draw[color=#1,line width=0.3pt] ");
	fprintf(fn, "({\\dx*%.4f},-4.1) -- ({\\dx*%.4f},4.2);\n",
		nullstellen(i), nullstellen(i));
end
kurve(fn, 0, nullstellen(1));
kurve(fn, nullstellen(1), nullstellen(2));
kurve(fn, nullstellen(2), nullstellen(3));
kurve(fn, nullstellen(3), 4);
fprintf(fn, "}\n");
fclose(fn);
