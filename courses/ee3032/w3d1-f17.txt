% EE3032 - W3D1 convolution example - Dr. Durant - 2017-09-13

N = 2000; % number of points to calculate at
t = linspace(-2,4,N);

x = zeros(size(t));
x(t>0 & t<1) = 1; % shortcut to u(t)-u(t-1)

h = exp(-2*t) .* (t>0); % shortcut to .* u(t)

% Hand-calculated result from class
y = NaN(size(t)); % safe initialization; avoid accidental 0s
y(t<=0) = 0;

idx = (0<t) & (t<1); % indexes into t&y arrays where t is in range
y(idx) = (1-exp(-2*t(idx)))/2; % piecewise integral derived in class

idx = t>=1;
y(idx) = (exp(-2*t(idx)+2)-exp(-2*t(idx)))/2;

% Numeric integration result using Riemann sums
dt = t(2)-t(1);
y2 = conv(x,h) * dt; % equivalently conv(h,x); DIGITAL convolution here
t2 = linspace(-4,8,N*2-1); % 2x original domain support, match sampled points

figure % Use a 3x1 grid with subplots 1..3
subplot(3,1,1),plot(t,x),title('x(t)')
subplot(3,1,2),plot(t,h),title('h(t)')
subplot(3,1,3),plot(t,y,'r--',t2,y2,'b-.'),title('y(t)'),legend('Analytic','Numeric'),xlim([-2 4]) % match x domain to other plots

