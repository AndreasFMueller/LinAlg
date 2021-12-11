#
# resonanz.m -- Bestimmung von omega0 und Q mit least squares
#
# (c) 2020 Prof Dr Andreas Müller, Hochschule Rapperswil
#

global omega0;
global Q;
omega0 = 1;
Q = 2;
n = 100;
err = 0.09;
W0 = 1;
skala = 0.45;

fn = fopen("paths.tex", "w");

fprintf(fn, "\\def\\omeganull{%.5f}\n", omega0);
fprintf(fn, "\\def\\Q{%.5f}\n", Q);

omega = omega0 * (1:n) / (n / 2);
W = (1:n);

for i = (1:n)
	W(i) = W0/hypot(1-(omega(i) / omega0)^2, omega(i) / (Q * omega0));
end

fprintf(fn, "\\def\\pfad{\n");
fprintf(fn, "\t(0,%.5f)\n", skala * W0);
for i = (1:n)
	fprintf(fn, "\t--(%.5f,%.5f)\n", omega(i), skala * W(i));
end
fprintf(fn, "}\n");

for i = (1:n)
	W(i) = W(i)/W0 + err * (rand() - 0.5);
end

fprintf(fn, "\\def\\punkte{\n");
for i = (1:n)
	fprintf(fn, "\t\\punkt{%.5f}{%.5f}\n", omega(i), skala * W(i));
end
fprintf(fn, "}\n");

W

b = W0 ./ W
b = (b .* b - 1)'

A = zeros(n, 2);
A(:,1) = (omega .* omega);
A(:,2) = A(:,1) .* A(:,1);
A

C = A' * A
eig(C)
c = A' * b
x = C \ c

omega0neu = (1/x(2,1))^0.25

Qneu = 1 / sqrt(2 + x(1,1) / sqrt(x(2,1)))


omega = omega0neu * (1:n) / (n / 2);
for i = (1:n)
	W(i) = W0/hypot(1-(omega(i) / omega0neu)^2, omega(i) / (Qneu * omega0neu));
end
fprintf(fn, "\\def\\pfadneu{\n");
fprintf(fn, "\t(0,%.5f)\n", skala * W(1));
for i = (2:n)
	fprintf(fn, "\t--(%.5f,%.5f)\n", omega(i), skala * W(i));
end
fprintf(fn, "}\n");

fprintf(fn, "\\def\\omeganeu{%.5f}\n", omega0neu);
fprintf(fn, "\\def\\Qneu{%.5f}\n", Qneu);

fclose(fn);
