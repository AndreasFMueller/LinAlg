A=[
 1, 0, 1, 3, 4;
 0, 1, 2,-1, 2;
 0, 0, 0, 0, 1
]
B = round(10 * rand(3,3) - 5 * ones(3,3))
det(B)

C=B*A

rref(C)


