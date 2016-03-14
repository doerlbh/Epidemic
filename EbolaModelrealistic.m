% developed by Baihan Lin
% Ebola Modeling

dt = 0.1;
till = 17;
t = 0:dt:till;

S0 = 100;
E0 = 0;
I0 = 0;
R0 = 0;
X0 = 0;
B00 = 99;
B10 = 1;

start = [S0;E0;I0;R0;X0;B00;B10];

a = 0.02;
v = 0.003;
b = 0.4;
k = 4;
w = 0.1;
g0 = 4;
g1 = 3;
ita = 0.5;
kb = 100000000;

coeff = [a; v; b; k; w; g0; g1; ita; kb];

[A, D] = diseaseFErealistic(dt, start, till, coeff);

figure
plot(t, A(1,:), 'LineWidth', 2); hold on
plot(t, A(2,:), 'LineWidth', 2); 
plot(t, A(3,:), 'LineWidth', 2);
plot(t, A(4,:), 'LineWidth', 2); 
plot(t, A(5,:), 'LineWidth', 2);
title('Ebola 2014 Outbreak Human Population Prediction (Realistic Model)');
xlabel('t');
ylabel('n');
legend('S','E', 'I', 'R','X');
ylim([0 100]);

figure
plot(t, A(6,:), 'LineWidth', 2); hold on
plot(t, A(7,:), 'LineWidth', 2); 
title('Ebola 2014 Outbreak Bat Population Prediction (Realistic Model)');
xlabel('t');
ylabel('n');
legend('B0','B1');

figure
plot(t, D(1,:), 'LineWidth', 2); hold on
plot(t, D(2,:), 'LineWidth', 2); 
plot(t, D(3,:), 'LineWidth', 2);
plot(t, D(4,:), 'LineWidth', 2); 
plot(t, D(5,:), 'LineWidth', 2);
title('Ebola 2014 Outbreak Human Population Derivatives (Realistic Model)');
xlabel('t');
ylabel('dn/dt');
legend('dS/dt','dE/dt', 'dI/dt', 'dR/dt','dX/dt');


filename = 'EpidemicWork.xlsx';
sheet = 1;
xlRange = 'A3:E20';
dataset = xlsread(filename,sheet,xlRange);

figure
plot([1:1:17], dataset(:,2), 'LineWidth', 2); hold on
plot([1:1:17], dataset(:,3), 'LineWidth', 2); 
plot([1:1:17], dataset(:,4), 'LineWidth', 2);
plot([1:1:17], dataset(:,5), 'LineWidth', 2); 

% x=datenum(2014:2015, 3, 7);
% datetick('x','yyyymm');

title('Ebola 2014 Outbreak Actual Data (Mar2014-July2015, 17 months)');
xlabel('month');
ylabel('population');
legend('Cases-SL','Death-SL', 'Cases-Gui', 'Death-Gui');
