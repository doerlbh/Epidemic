% developed by Baihan Lin

function [A, D] = diseaseFErealistic(dt, start, till, coeff)

a = coeff(1);
v = coeff(2);
b = coeff(3);
k = coeff(4);
w = coeff(5);
g0 = coeff(6);
g1 = coeff(7);
ita = coeff(8);
kb = coeff(9);

S0 = start(1);
E0 = start(2);
I0 = start(3);
R0 = start(4);
X0 = start(5);
B00 = start(6);
B10 = start(7);

f = @(t, y) [-b*y(1)*y(3)/(y(1)+y(2)+y(3)+y(4)+y(5))-w*y(7)*y(1);
    b*y(1)*y(3)/(y(1)+y(2)+y(3)+y(4)+y(5))-k*y(2)+w*y(7)*y(1);
    k*y(2)-g0*y(3)*(1-ita)-g1*y(3)*ita;
    g0*y(3)*(1-ita);
    g1*y(3)*ita;
    v*(y(6)+y(7))*(1-(y(6)+y(7))/kb)-a*y(6)*y(7);
    a*y(6)*y(7)];

t = 0:dt:till;
n = length(t);

A = zeros(7, length(t));
D = zeros(7, length(t));
A(:, 1) = [S0;E0;I0;R0;X0;B00;B10];
D(:, 1) = f(t(1), A(:, 1));

for k = 1:n-1
    A(:, k+1) = A(:, k) + dt * f(t(k), A(:, k));
    D(:, k+1) = f(t(k+1), A(:, k+1));
end

end