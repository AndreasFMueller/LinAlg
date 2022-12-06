#
# r.m
#
# (c) 2021 Prof Dr Andreas Müller, OST Ostschweizer Fachhochschule
#
e3 = [ 0; 0; 1 ];

r1 = [ 1; 1; -1 ]; r1 = r1 / norm(r1);
r2 = cross(e3, r1); r2 = r2 / norm(r2);
r3 = cross(r1, r2);

R = zeros(3,3);
R(:,1) = r1;
R(:,2) = r2;
R(:,3) = r3;

winkel = acosd((trace(R) - 1)/2)

fn = fopen("matrix2.inc", "w");
fprintf(fn, "matrix<\n");
fprintf(fn, "%.5f, %.5f, %.5f,\n", R(1,1), R(3,1), R(2,1));
fprintf(fn, "%.5f, %.5f, %.5f,\n", R(1,3), R(3,3), R(2,3));
fprintf(fn, "%.5f, %.5f, %.5f,\n", R(1,2), R(3,2), R(2,2));
fprintf(fn, "%.5f, %.5f, %.5f\n", 0, 0, 0);
fprintf(fn, ">\n");
fclose(fn);

R1 = R;

R = [
	0, -1, 0;
        1,  0, 0;
	0,  0, 1
];

fn = fopen("matrix3.inc", "w");
fprintf(fn, "matrix<\n");
fprintf(fn, "%.5f, %.5f, %.5f,\n", R(1,1), R(3,1), R(2,1));
fprintf(fn, "%.5f, %.5f, %.5f,\n", R(1,3), R(3,3), R(2,3));
fprintf(fn, "%.5f, %.5f, %.5f,\n", R(1,2), R(3,2), R(2,2));
fprintf(fn, "%.5f, %.5f, %.5f\n", 0, 0, 0);
fprintf(fn, ">\n");
fclose(fn);

R2 = R * inverse(R1)

winkel = acosd((trace(R2) - 1)/2)
