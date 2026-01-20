%
% loesung.m
%
% (c) 2024 Prof Dr Andreas Müller
%

x = [  2.8213;  1.2019;  3.8204 ]
y = [  3.4351; -1.5060;  2.0987 ]

A = zeros(3,1);
A(:,1) = x;
A(:,2) = y
b = x .* y

M = A' * A

v = A' * b

A \ b
