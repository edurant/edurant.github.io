% EE3032 - W2D2 - Dr. Durant
% Additivity of power of sinusoids, section 1.3.4.
% This works even for frequencies that are not harmonically related.

f1 = 2; % Hz
f2 = 3;

T = 4; % end time, s
N = 1000; % Number of samples for graph/calculation
t = linspace(0,T,N); % calculation times, simple approach
t = ((0:N)/N)*T; % Slightly better approach; see note at end. 
% These are NOT quite the same points as before. They are packed slightly tighter. 

x1 = cos(2*pi*f1*t);
x2 = cos(2*pi*f2*t);
x = x1 + x2;
figure,subplot(2,1,1)
plot(t,x1,t,x2,t,x),title('Input voltages')
legend('x_1','x_2','x'),xlabel('Time (s)'),ylabel('Voltage (V)')
subplot(2,1,2)
plot(t,x1.^2,t,x2.^2,t,x.^2),title('Power')
legend('x_1^2','x_2^2','x^2'),xlabel('Time (s)'),ylabel('Power (W)')

Px = sum(x.^2) / length(t)
Px1 = sum(x1.^2) / length(t)
Px2 = sum(x2.^2) / length(t)

% You can see some rounding error when using linspace in Px since this simulation 
% isn't *quite* periodic. Specifically, we are including the point at 4 s, which 
% is the end of the period (limit from left) in addition to the point at 0 (limit
% from right). To limit roundoff error, you can increase N, or omit the left limit
% (2nd definition of t above eliminates roundoff error).