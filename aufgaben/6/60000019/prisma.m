#
# dekaeder.m -- Punkte des Dekaeders berechnen
#
# (c) 2018 Prof Dr Andreas Müller, Hochschule Rapperswil
#
D = [
       -1/2, sqrt(3)/2, 0;
          0,         0, 1;
  sqrt(3)/2,       1/2, 0
];
det(D)
R = [
  cosd(60), -sind(60), 0;
  sind(60),  cosd(60), 0;
         0,         0, 1
];
A1 = [ sqrt(3)/2; 1/2; 1 ];
A2 = R * A1;
A3 = R * A2;
A4 = R * A3;
A5 = R * A4;
A6 = R * A5;
C1 = [ sqrt(3)/2; 1/2; -1 ];
C2 = R * C1;
C3 = R * C2;
C4 = R * C3;
C5 = R * C4;
C6 = R * C5;

B = [ 0; 1; 0 ];

f = fopen("left.inc", "w");
fprintf(f, "#declare A1 = <%.6f, %.6f, %.6f>;\n", A1(1), A1(3), A1(2));
fprintf(f, "#declare A2 = <%.6f, %.6f, %.6f>;\n", A2(1), A2(3), A2(2));
fprintf(f, "#declare A3 = <%.6f, %.6f, %.6f>;\n", A3(1), A3(3), A3(2));
fprintf(f, "#declare A4 = <%.6f, %.6f, %.6f>;\n", A4(1), A4(3), A4(2));
fprintf(f, "#declare A5 = <%.6f, %.6f, %.6f>;\n", A5(1), A5(3), A5(2));
fprintf(f, "#declare A6 = <%.6f, %.6f, %.6f>;\n", A6(1), A6(3), A6(2));
fprintf(f, "#declare C1 = <%.6f, %.6f, %.6f>;\n", C1(1), C1(3), C1(2));
fprintf(f, "#declare C2 = <%.6f, %.6f, %.6f>;\n", C2(1), C2(3), C2(2));
fprintf(f, "#declare C3 = <%.6f, %.6f, %.6f>;\n", C3(1), C3(3), C3(2));
fprintf(f, "#declare C4 = <%.6f, %.6f, %.6f>;\n", C4(1), C4(3), C4(2));
fprintf(f, "#declare C5 = <%.6f, %.6f, %.6f>;\n", C5(1), C5(3), C5(2));
fprintf(f, "#declare C6 = <%.6f, %.6f, %.6f>;\n", C6(1), C6(3), C6(2));
fprintf(f, "#declare B = <%.6f, %.6f, %.6f>;\n", B(1), B(3), B(2));
fprintf(f, "#declare D = <%.6f, %.6f, %.6f>;\n", D(1), D(3), D(2));
fclose(f);

A1 = D * A1;
A2 = D * A2;
A3 = D * A3;
A4 = D * A4;
A5 = D * A5;
A6 = D * A6;
C1 = D * C1;
C2 = D * C2;
C3 = D * C3;
C4 = D * C4;
C5 = D * C5;
C6 = D * C6;
B = D * B;

f = fopen("right.inc", "w");
fprintf(f, "#declare A1 = <%.6f, %.6f, %.6f>;\n", A1(1), A1(3), A1(2));
fprintf(f, "#declare A2 = <%.6f, %.6f, %.6f>;\n", A2(1), A2(3), A2(2));
fprintf(f, "#declare A3 = <%.6f, %.6f, %.6f>;\n", A3(1), A3(3), A3(2));
fprintf(f, "#declare A4 = <%.6f, %.6f, %.6f>;\n", A4(1), A4(3), A4(2));
fprintf(f, "#declare A5 = <%.6f, %.6f, %.6f>;\n", A5(1), A5(3), A5(2));
fprintf(f, "#declare A6 = <%.6f, %.6f, %.6f>;\n", A6(1), A6(3), A6(2));
fprintf(f, "#declare C1 = <%.6f, %.6f, %.6f>;\n", C1(1), C1(3), C1(2));
fprintf(f, "#declare C2 = <%.6f, %.6f, %.6f>;\n", C2(1), C2(3), C2(2));
fprintf(f, "#declare C3 = <%.6f, %.6f, %.6f>;\n", C3(1), C3(3), C3(2));
fprintf(f, "#declare C4 = <%.6f, %.6f, %.6f>;\n", C4(1), C4(3), C4(2));
fprintf(f, "#declare C5 = <%.6f, %.6f, %.6f>;\n", C5(1), C5(3), C5(2));
fprintf(f, "#declare C6 = <%.6f, %.6f, %.6f>;\n", C6(1), C6(3), C6(2));
fprintf(f, "#declare B = <%.6f, %.6f, %.6f>;\n", B(1), B(3), B(2));
fprintf(f, "#declare D = <%.6f, %.6f, %.6f>;\n", D(1), D(3), D(2));
fclose(f);


