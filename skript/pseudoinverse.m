echo_executing_commands(7);
A = [1,2,9,1;2,0,1,5]
[U,S,V] = svd(A)
Sdagger = S';
Sdagger(1,1)=1/S(1,1);
Sdagger(2,2)=1/S(2,2)
Sdagger * S
S * Sdagger
Adagger = V * Sdagger * U'
A * Adagger
P = Adagger * A
P * P - P
