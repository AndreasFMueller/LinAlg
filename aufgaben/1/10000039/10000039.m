#
# 10000039.m -- erzeuge Matrizen, die sich ganzzahlig invertieren lassen
#
# (c) 2015 Prof Dr Andreas Mueller, Hochschule Rapperswil
#
n = 4;
zahlenbereich = 3;
m = 2 * zahlenbereich + 1;

B1 = tril(round(m * rand(n) - zahlenbereich), -1) + eye(n);
B2 = triu(round(m * rand(n) - zahlenbereich), 1) + eye(n);
D = round(B1 * B2)
E = round(inverse(D))

# Kontrolle:
D * E

