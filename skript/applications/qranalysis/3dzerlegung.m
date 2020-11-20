#
# 3dzerlegung.m
#
# (c) 2020 Prof Dr Andreas Müller, Hochschule Rapperswil
#
global R;
global R0;
global Q;
global S1;
global S2
global S3;
global S;
global u;
global U;
global alpha;

u = [ 1; -0.5; 1 ];
u = u / norm(u);
alpha = 40;
U = [
	 0     , -u(3,1),  u(2,1);
	 u(3,1),  0     , -u(1,1);
	-u(2,1),  u(1,1),  0
];
Q = u * u' + cosd(alpha) * (eye(3) - u*u') + sind(alpha) * U;

R1 = [
   1,  0.5,  0;
   0,  1,    0;
   0,  0,    1
];
R2 = [
   1,  0,  -0.6;
   0,  1,  0;
   0,  0,  1
];
R3 = [
   1,  0,  0;
   0,  1,  0.4;
   0,  0,  1
];
R0 = R3 * R2 * R1

S1 = [
   1.4, 0,  0;
   0,   1,  0;
   0,   0,  1
];
S2 = [
   1,  0,   0;
   0,  1.2, 0;
   0,  0,   1
];
S3 = [
   1,  0,  0;
   0,  1,  0;
   0,  0,  0.6
];
S = S3 * S2 * S1;

R = R0 * S;

A = Q * R
Q
Q*Q'
det(Q)
R1
R2
R3
R0
S1
S2
S3
S
R
det(A)

global lA;
lA = logm(A);

function retval = At(t)
	global lA;
	retval = expm(t * lA);
end

function retval = R0t(t)
	global R0;
	retval = R0;
	retval(1,2) = t * retval(1,2);
	retval(1,3) = t * retval(1,3);
	retval(2,3) = t * retval(2,3);
end

function retval = Rt(t)
	global R;
	retval = R;
	retval(1,2) = t * retval(1,2);
	retval(1,3) = t * retval(1,3);
	retval(2,3) = t * retval(2,3);
	retval(1,1) = (1-t) + t * retval(1,1);
	retval(2,2) = (1-t) + t * retval(2,2);
	retval(3,3) = (1-t) + t * retval(3,3);
end

global lQ;
lQ = logm(Q);

function retval = Qt(t)
	global U;
	global u;
	global alpha;
	retval = u*u' + cosd(t * alpha) * (eye(3) - u*u') + sind(t * alpha) * U;
end

function retval = S1t(t)
	global S1;
	retval = S1;
	retval(1,1) = (1-t) + t * S1(1,1);
end

function retval = S2t(t)
	global S2;
	retval = S2;
	retval(2,2) = (1-t) + t * S2(2,2);
end

function retval = S3t(t)
	global S3;
	retval = S3;
	retval(3,3) = (1-t) + t * S3(3,3);
end

function retval = R1t(t)
	global R;
	retval = R;
	retval(1,2) = t * retval(1,2);
	retval(1,3) = 0;
	retval(2,3) = 0;
end

function retval = R2t(t)
	global R;
	retval = R;
	retval(1,3) = t * retval(1,3);
	retval(2,3) = 0;
end

function retval = R3t(t)
	global R;
	retval = R;
	retval(2,3) = t * retval(2,3);
end

function drawmatrix(fn, M, prefix)
	for i = (1:3)
		fprintf(fn, "#declare %s_bild%d = < %.4f, %.4f, %.4f >;\n",
			prefix, i, M(1,i), M(3,i), M(2,i));
	end
end

function drawA(fn, t, prefix)
	drawmatrix(fn, At(t), prefix);
end

function drawR(fn, t, prefix)
	drawmatrix(fn, Rt(t), prefix);
end

function drawR0(fn, t, prefix)
	drawmatrix(fn, R0t(t), prefix);
end

function drawR1(fn, t, prefix)
	drawmatrix(fn, R1t(t), prefix);
end

function drawR2(fn, t, prefix)
	drawmatrix(fn, R2t(t), prefix);
end

function drawR3(fn, t, prefix)
	drawmatrix(fn, R3t(t), prefix);
end

function drawS(fn, t, prefix)
	drawmatrix(fn, S1t(t), prefix);
end

function drawSS(fn, t, prefix)
	global S1;
	drawmatrix(fn, S2t(t) * S1, prefix);
end

function drawSSS(fn, t, prefix)
	global S1;
	global S2;
	drawmatrix(fn, S3t(t) * S2 * S1, prefix);
end

function drawQR(fn, t, prefix)
	global R;
	x = Qt(t) * R;
	drawmatrix(fn, Qt(t) * R, prefix);
end

global L;
L = 7;

function retval = tt(t, n)
	global L;
	retval = (1 - cos(pi * L * (t - n/L))) / 2;
end

function draw(fn, t)
	global L;
	if (t <= 1/L)
		drawS(fn,   tt(t, 0), "v");
	elseif (t <= 2/L)
		drawSS(fn,  tt(t, 1), "v");
	elseif (t <= 3/L)
		drawSSS(fn, tt(t, 2), "v");
	elseif (t <= 4/L)
		drawR1(fn,  tt(t, 3), "v");
	elseif (t <= 5/L)
		drawR2(fn,  tt(t, 4), "v");
	elseif (t <= 6/L)
		drawR3(fn,  tt(t, 5), "v");
	else
		drawQR(fn,  tt(t, 6), "v")
	end
end

function drawB(fn, t, prefix)
	drawR(fn, t, prefix);
end

n0 = 100;
d = 7;
global N;
N = d * n0;

for i = (0:N)
	filename = sprintf("vectors/v%04d.inc", i);
	t = i / N;
	fn = fopen(filename, "w");
	draw(fn, t);
	fclose(fn);
	if (0 == rem(i, d))
		j = i / d;
		filename = sprintf("vectors/a%04d.inc", j);
		t = j / n0;
		fa = fopen(filename, "w");
		drawA(fa, t, "v");
		fclose(fa);
	end
end



