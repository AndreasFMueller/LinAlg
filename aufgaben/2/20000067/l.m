%
% l.m -- Beispiel für Cramer
%
% (c) 2025 Prof Dr Andreas Müller
%
rand("seed", 4718)
l = 10;

d = 0;
A = zeros(2, 2);
x = zeros(2, 1);
b = zeros(2, 1);
while (d == 0)
	A = round(3 * l * rand(2,2) - l * ones(2,2));
	x = round(3 * l * rand(2,1) - l * ones(2,1));
	for i = (1:2)
		for k = (1:2)
			if (A(i, k) >= 0)
				A(i, k) = A(i, k) + 1;
			end
		end
		if (x(i,1) >= 0)
			x(i,1) = x(i,1) + 1;
		end
	end
	b = A*x;
	d = det(A);
end
A
x
b
