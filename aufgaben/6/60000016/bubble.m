#
# bubble.m
#
# (c) 2018 Prof Dr Andreas Müller, Hochschule Rapperswil
#
global D;
global K;
global P0;

f = 135;
m = [ 160; 90 ];
K = [
      f, 0, m(1,1);
      0, f, m(2,1);
      0, 0,      1
]

P0 = [  0.5;  0.5; -1.0 ];

P1 = [ -1.0;  0.0;  0.5 ];
P2 = [ -0.5;  0.5;  1.0 ];

I  = [  1.0;  0.0;  0.0 ];

S  = (2*I + P1 + P2)/4



# compute a rotation matrix that rotates
# e3 -> into the direction
# e1 -> to the right
# e2 -> "vertical"
function R = drehmatrix(richtung, winkel)
	R = eye(3,3);
	R(:,3) = richtung / norm(richtung);

	e3 = [ 0; 1; 0 ];
	R(:,2) = e3 - dot(R(:,3), e3) * R(:,3);
	R(:,2) = R(:,2) / norm(R(:,2));

	R(:,1) = cross(R(:,2), R(:,3));
	R = R * [ cos(winkel), -sin(winkel), 0;
		  sin(winkel),  cos(winkel), 0;
			    0,            0, 1 ];
endfunction

D = drehmatrix(P0, pi);
D = inverse(D);
Drounded = round(1000 * D) / 1000
Drounded'*Drounded
det(Drounded)

function P = project(v)
	global D
	global K
	global P0
	P = K * D * (v - P0);
	P = P(1:2,1) / P(3,1);
endfunction

o = project(zeros(3,1))
s = project(S)
i = project(I)
b1 = project(P1)
b2 = project(P2)

printf("b1 rounded:\n");
b1rounded = round(b1)
printf("b2 rounded:\n");
b2rounded = round(b2)

function v = harmonize(v0)
	v = ones(3,1);
	v(1:2,1) = v0;
endfunction

printf("r1:\n");
r1 = inverse(K*Drounded)*harmonize(b1rounded)
P1approx = P0 - 1.5 * r1/r1(1,1)
printf("r2:\n");
r2 = inverse(K*Drounded)*harmonize(b2rounded)
P2approx = P0 + 2 * r2/r2(3,1)

d1 = P1approx - S
d2 = P2approx - S

scalarprodut = d1' * d2
norm(d1)
norm(d2)

cosalpha = d1' * d2 / (norm(d1) * norm(d2))
alpha = acosd( cosalpha )

printf("t:\n");
t = -1.5 / r1(1)
printf("p1:\n");
p1 = P0 + t * r1

printf("s:\n");
s = 2 / r2(3)
printf("p2:\n");
p2 = P0 + s * r2

