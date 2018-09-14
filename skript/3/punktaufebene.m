A = [
  1, 0, 1;
  0, 1, 2;
  0, 0, 0
]

B = round(10 * rand(3,3) - 5 * ones(3, 3))

C = B * A

rref(C)
