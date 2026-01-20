%
% drehung.m -- loesung der Shamisen Aufgabe
%
% (c) 2023 Prof Dr Andreas Müller
%

a1 = [ -1;  1; 0 ]; a1 = a1 / norm(a1);
a2 = [ -1; -1; 0 ]; a2 = a2 / norm(a2);
a3 = [  0;  0; 1 ];

b1 = [ -sqrt(3)/2; 0; 0.5 ];
b2 = [ 0.5; 0; sqrt(3)/2 ];
b3 = [ 0; 1; 0 ];

A = zeros(3, 3);
A(:,1) = a1;
A(:,2) = a2;
A(:,3) = a3;
A
det(A)
B = zeros(3, 3);
B(:,1) = b1;
B(:,2) = b2;
B(:,3) = b3;
B
det(B)

format long
O = B*inverse(A)
O * O'

[V, lambda] = eig(O)

t = trace(O)
t1 = t - 1
t2 = t1 / 2
alpha = acosd(t2)

