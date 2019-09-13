#
# dekaeder.m -- Punkte des Dekaeders berechnen
#
# (c) 2018 Prof Dr Andreas Müller, Hochschule Rapperswil
#
M = [
  0, -1,  0;
  0,  0,  1;
  1,  0,  0
];
det(M)
R = [
  cosd(72), -sind(72), 0;
  sind(72),  cosd(72), 0;
         0,         0, 1
];
A1 = [ 0; 1; 0 ];
A2 = R * A1;
A3 = R * A2;
A4 = R * A3;
A5 = R * A4;

B = [ 0; 0; (sqrt(5) - 1) / 2 ];
D = -B;

f = fopen("left.inc", "w");
fprintf(f, "#declare A1 = <%.6f, %.6f, %.6f>;\n", A1(1), A1(3), A1(2));
fprintf(f, "#declare A2 = <%.6f, %.6f, %.6f>;\n", A2(1), A2(3), A2(2));
fprintf(f, "#declare A3 = <%.6f, %.6f, %.6f>;\n", A3(1), A3(3), A3(2));
fprintf(f, "#declare A4 = <%.6f, %.6f, %.6f>;\n", A4(1), A4(3), A4(2));
fprintf(f, "#declare A5 = <%.6f, %.6f, %.6f>;\n", A5(1), A5(3), A5(2));
fprintf(f, "#declare B = <%.6f, %.6f, %.6f>;\n", B(1), B(3), B(2));
fprintf(f, "#declare D = <%.6f, %.6f, %.6f>;\n", D(1), D(3), D(2));
fclose(f);

A1 = M * A1;
A2 = M * A2;
A3 = M * A3;
A4 = M * A4;
A5 = M * A5;
B = M * B;
D = M * D;

f = fopen("right.inc", "w");
fprintf(f, "#declare A1 = <%.6f, %.6f, %.6f>;\n", A1(1), A1(3), A1(2));
fprintf(f, "#declare A2 = <%.6f, %.6f, %.6f>;\n", A2(1), A2(3), A2(2));
fprintf(f, "#declare A3 = <%.6f, %.6f, %.6f>;\n", A3(1), A3(3), A3(2));
fprintf(f, "#declare A4 = <%.6f, %.6f, %.6f>;\n", A4(1), A4(3), A4(2));
fprintf(f, "#declare A5 = <%.6f, %.6f, %.6f>;\n", A5(1), A5(3), A5(2));
fprintf(f, "#declare B = <%.6f, %.6f, %.6f>;\n", B(1), B(3), B(2));
fprintf(f, "#declare D = <%.6f, %.6f, %.6f>;\n", D(1), D(3), D(2));
fclose(f);


