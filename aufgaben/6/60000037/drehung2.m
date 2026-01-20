%
% drehung2.m
%
% (c) 2023 Prof Dr Andreas Müller
%

n0 = [ 1; 0; -1 ];
n0 = n0 / norm(n0);
n0p = [ 1; 0; 1 ];
n0p = n0p / norm(n0p);

n1 = [ 0; 1; -1 ];
n1 = n1 / norm(n1);
phi = acos(dot(n0, n1)) - pi/4
n1p = [ cos(phi); 0; -sin(phi) ];

n2 = cross(n0, n1)
n2 = n2 / norm(n2);
n2p = cross(n0p, n1p)
n2p = n2p / norm(n2p);

format long

B = zeros(3,3);
B(:,1) = n0;
B(:,2) = n1;
B(:,3) = n2;
B

Bp = zeros(3,3);
Bp(:,1) = n0p;
Bp(:,2) = n1p;
Bp(:,3) = n2p;
Bp

O = Bp * inverse(B)

trace(O)
acosd((trace(O)-1)/2)

O * O'
p = [ 1, 3, 2 ];
for i = (1:3)
	for j = (1:3)
		Opovray(i, j) = O(p(i), p(j));
	end
end

Opovray * Opovray'

Opovray(:,4) = zeros(3,1);

fn = fopen("drehung2.inc", "w");
fprintf(fn, "#macro drehmatrix2()\n");
fprintf(fn, "\tmatrix <");
for k = (1:4)
	if (k > 1) 
		fprintf(fn, ",");
	end
	fprintf(fn, "\n\t\t");
	for i = (1:3)
		fprintf(fn, "%10.6f", Opovray(i, k))
		if (i < 3)
			fprintf(fn, ",");
		end
	end
end
fprintf(fn, "\n\t>\n");
fprintf(fn, "#end\n");
fclose(fn);
