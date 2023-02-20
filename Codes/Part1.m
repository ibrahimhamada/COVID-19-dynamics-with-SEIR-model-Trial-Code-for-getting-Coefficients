clc;
clear;
theta = unifrnd(-pi,pi, 1000);
omegac = 2*pi;
A = 5;
t = linspace(-5, 5, 1000);
for i = 1:1000
    X(i,:) = A * cos(omegac.*t + theta(1,i));
end

writematrix(X,'Amplitude.txt');
writematrix(t,'Time.txt');

