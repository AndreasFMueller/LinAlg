#
# kamerageometrie.m -- Berechnungen zur Kamerageometrie-Aufgabe
#
# (c) 2017 Prof Dr Andreas Müller, Hochschule Rapperswil
#
f = 100;
M = [ 60; 45 ];
global K = [
     f,   0, M(1,1);
     0,   f, M(2,1);
     0,   0,      1
]

# compute a rotation matrix that rotates
# e3 -> into the direction 
# e1 -> to the right
# e2 -> "vertical"
function R = drehmatrix(richtung, winkel)
	R = eye(3,3);
	e3 = [0;0;1];
	R(:,3) = richtung / norm(richtung);
	R(:,2) = e3 - dot(R(:,3), e3) * R(:,3);
	R(:,2) = R(:,2) / norm(R(:,2));
	R(:,1) = cross(R(:,2), R(:,3));
	R = R * [ cos(winkel), -sin(winkel), 0;
	          sin(winkel),  cos(winkel), 0;
	                    0,            0, 1 ];
endfunction

function qtilde = harmonize(q)
	n = size(q)(1,1);
	qtilde = ones(n+1,1);
	qtilde(1:n, 1) = q;
endfunction

function P = projectionmatrix(D,c)
	global K;
	E = zeros(3,4);
	E(:,1:3) = eye(3,3);
	E(:,4) = -c;
	P = K * D * E;
endfunction

function b = project(P, q)
	if (size(q)(1,1) == 3)
		qtilde = harmonize(q);
	else
		qtilde = q;
	end
	btilde = P * qtilde;
	btilde = btilde / btilde(3,1);
	b = btilde(1:2,1);
endfunction

function r = richtungsvektor(D,b)
	global K;
	btilde = harmonize(b);
	r = inverse(K * D) * btilde;
endfunction

