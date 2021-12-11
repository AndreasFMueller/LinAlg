#
# t.m -- Berechnunge für Aufgabe 60000025
#
v3 = [ -1; 1; 2 ];
v3 = v3 / norm(v3)

v1 = [ 3; 1; 1];
v1 = v1 / norm(v1);

v2 = cross(v3, v1)
v2 * sqrt(66)

D = zeros(3,3);
D(:,1) = v1;
D(:,2) = v2;
D(:,3) = v3

# Kontrolle
D*transpose(D) - eye(3)

A = D([1,3,2],[1,3,2])
transpose(A)

(trace(D) - 1)/2

acosd((trace(D) - 1)/2)
