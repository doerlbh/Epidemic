% developed by Baihan Lin
% Ebola Modeling

dt = 0.1;
till = 50;
t = 0:dt:till;

aset = 0:0.01:1;

S0 = 100;
E0 = 0;
I0 = 0;
R0 = 0;
X0 = 0;
B00 = 99;
B10 = 1;

start = [S0;E0;I0;R0;X0;B00;B10];

a = 0.0;
v = 0.003;
b = 0.4;
k = 4;
w = 0.1;
g0 = 4;
g1 = 3;
ita = 0.5;
kb = 100000000;

coeff = [a; v; b; k; w; g0; g1; ita; kb];

[B1] = aBifurdiseaseFErealistic(dt, start, till, coeff);
[B2] = bBifurdiseaseFErealistic(dt, start, till, coeff);
[B3] = wBifurdiseaseFErealistic(dt, start, till, coeff);

figure
plot(aset, B1(1,:), 'LineWidth', 2); hold on
plot(aset, B1(2,:), 'LineWidth', 2); 
plot(aset, B1(3,:), 'LineWidth', 2);
plot(aset, B1(4,:), 'LineWidth', 2); 
plot(aset, B1(5,:), 'LineWidth', 2);
title('Bifurcation of Bat-Bat Contamination Rate \alpha (Realistic Model)');
xlabel('\alpha');
ylabel('steady state');
legend('S','E', 'I', 'R','X');
xlim([0 1]);

figure
plot(aset, B2(1,:), 'LineWidth', 2); hold on
plot(aset, B2(2,:), 'LineWidth', 2); 
plot(aset, B2(3,:), 'LineWidth', 2);
plot(aset, B2(4,:), 'LineWidth', 2); 
plot(aset, B2(5,:), 'LineWidth', 2);
title('Bifurcation of Human-Human Transmission Rate \beta (Realistic Model)');
xlabel('\beta');
ylabel('steady state');
legend('S','E', 'I', 'R','X');
xlim([0 1]);

figure
plot(aset, B3(1,:), 'LineWidth', 2); hold on
plot(aset, B3(2,:), 'LineWidth', 2); 
plot(aset, B3(3,:), 'LineWidth', 2);
plot(aset, B3(4,:), 'LineWidth', 2); 
plot(aset, B3(5,:), 'LineWidth', 2);
title('Bifurcation of Bat-Human Transmission Rate \omega (Realistic Model)');
xlabel('\omega');
ylabel('steady state');
legend('S','E', 'I', 'R','X');
xlim([0 1]);

