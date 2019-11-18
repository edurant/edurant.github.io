% EE3032 - Dr. Durant - W3D4 example - 9/27/2019 1:56 PM

% We drew x(t) and h(t) on the board and then evaluated y(t) by convolving
% the 2 signals, identifying 3 regions where the effective limits on the
% integral changed due to how the functions overlapped.
% x(t) = u(t) - u(t-2)
% h(t) = 3*exp(-2*t)*u(t); the u(t) makes this a *causal* impulse response

format compact % skip fewer lines / fit more on screen

t = linspace(-1,8,5000); % [0,8] s, evaluated at 5000 points
y = zeros(size(t)); % allocate and initialize to 0; this is the correct value for region 0, where t<=0
r1 = (0<=t) & (t<=2); % Boolean array that has true values only in region 1
% r1(1000) % here's how we displayed the values in class
% t(1000) % The following line is a more descriptive way of doing this
idx = 1000; fprintf('At time %g, the region 1 indicator value is %g\n',t(idx),r1(idx))
y(r1) = (-3/2)*(exp(-2*t(r1))-1); % region 1 expression, evaluate in region 1, assign only in region 1 (thus there are the same number of values on the left and right sides of the assignment)
r2 = t>=2; % true only in region 2
y(r2) = (-3/2)*(exp(-2*(t(r2)))-exp(-2*(t(r2)-2))); % evaluate in region 2
plot(t,y)

% Addition, plot h and x
h = 3*exp(-2*t).*(t>=0); % note how we handled u(t); .* does element-wise multiplication; * attempts *matrix* multiplication, which would be illegal given the matching orientation (row vectors) of the inputs
x = (t>=0) - (t>=2);
figure % open a new figure window
plot(t,h,t,x),xlabel('Time (s)'),legend('h(t)','x(t)')
