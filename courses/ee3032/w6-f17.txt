% EE3032 - W6 Example - Dr. Durant - Steady-state response and eigenfunctions

N = 1000; % number of points to plot
t = linspace(0,20,N); % causal system, up to specified seconds
dt = t(2)-t(1);
Omega = pi/2; % radians/s
x = sin(Omega*t);

% Example 1: h = u(tau) - u(tau-1), unit pulse
h = double(t < 1); % we assume t >= 0 because of how we set up t; convert logical(boolean) to double
y = conv(x,h)*dt; y=y(1:N); % keep only first N samples of y so it aligns with other signals
% conv performs a *digital* convolution (more in EE3221 next term),
% but we can approximate the *analog* convolution by scaling by dt.

% Example 1.2: now use eigenfunction property
H = 1j/Omega*(exp(-1j*Omega)-1); % formula derived in class
yss = abs(H) * sin(Omega*t + angle(H));

figure
plot(t,h,t,x,t,y,t,yss)
legend('h(t)','x(t) = sin(\Omega{t})','y(t) = x(t)*h(t)','y_{ss}(t) = |H|sin(\Omega{t}+\angle{H})')

% Note: Omega = 2*pi is an interesting case.  Why?  Hint: Calculate H.