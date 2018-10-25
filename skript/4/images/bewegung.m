#
# bewegung.m
#
# (c) 2018 Prof Dr Andreas Müller, Hochschule Rapperswil
#
N = 30;
x = 8 * rand(N, 1) + 1;
y = 5 * rand(N, 1);

X = x';
X(2,:) = y';
X(3,:) = ones(1,N);

X

t = [2; 1];

alpha = 10;
T = [
    cosd(alpha), -sind(alpha), t(1);
    sind(alpha),  cosd(alpha), t(2)
];

Y0 = T * X;
Y  = Y0 + normrnd(0, 0.1, 2, N);

A = zeros(2*N,4);

A(  1:  N,1) =  x;
A(  1:  N,2) = -y;
A(N+1:2*N,1) =  y;
A(N+1:2*N,2) =  x;
A(  1:  N,3) =  ones(N,1);
A(N+1:2*N,3) =  zeros(N,1);
A(  1:  N,4) =  zeros(N,1);
A(N+1:2*N,4) =  ones(N,1)

A

b = zeros(2*N, 1);
b(  1:  N,1) = Y(1,:)';
b(N+1:2*N,1) = Y(2,:)';

b

v = A \ b

alpha2 = atan2(v(2),v(1));

T2 = [
 cos(alpha2), -sin(alpha2), v(3);
 sin(alpha2),  cos(alpha2), v(4)
];

Z = T2 * X;

fn = fopen("bewegung.pkt", "w");

for i = (1:N)
	fprintf(fn, "\\pa{(%.3f,%.3f)}\n", x(i), y(i));
	fprintf(fn, "\\pc{(%.3f,%.3f)}\n", Z(1,i), Z(2,i));
	fprintf(fn, "\\pb{(%.3f,%.3f)}\n", Y(1,i), Y(2,i));
	fprintf(fn, "\\draw[color=darkgreen] (%.3f,%.3f)--(%.3f,%.3f);\n",
		Y0(1,i), Y0(2,i), Y(1,i), Y(2,i));
end

P = T * [
	20, -20,   0,   0;
         0,   0, -10,  10;
         1,   1,   1,   1
];
P2 = T2 * [
	20, -20,   0,   0;
         0,   0, -10,  10;
         1,   1,   1,   1
];

fprintf(fn, "\\begin{scope}\n");
fprintf(fn, "\\clip (-0.3, -0.3) rectangle (11.3,7.5);\n");

fprintf(fn, "\\draw[color=darkgreen] (%.3f,%.3f)--(%.3f,%.3f);",
	P(1,1), P(2,1), P(1,2), P(2,2));
fprintf(fn, "\\draw[color=darkgreen] (%.3f,%.3f)--(%.3f,%.3f);",
	P(1,3), P(2,3), P(1,4), P(2,4));

fprintf(fn, "\\draw[color=red] (%.3f,%.3f)--(%.3f,%.3f);",
	P2(1,1), P2(2,1), P2(1,2), P2(2,2));
fprintf(fn, "\\draw[color=red] (%.3f,%.3f)--(%.3f,%.3f);",
	P2(1,3), P2(2,3), P2(1,4), P2(2,4));

fprintf(fn, "\\end{scope}\n");

fclose(fn);
