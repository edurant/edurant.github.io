% EE3032 - W6 Example - Dr. Durant - Steady-state response and eigenfunctions
% See the simple example first. This more complicated example re-uses code
% by factoring the script into several subfunctions to allow analysis of
% all 3 class examples virtually no needless duplication of code.

% Example 1 - functions h1 and H1 defined below
doExample(@h1, @H1, 'h(t) = u(t) - u(t-1)')
% Note: Omega = 2*pi is an interesting case for Example 1.  Why?  Hint: Calculate H.

% Example 2 - here we need to pass alpha to both functions
h = @(t    )h2(t    ,0.1);
H = @(Omega)H2(Omega,0.1);
doExample(h,H, 'h(t) = e^{-\alpha{t}} u(t), \alpha > 0')

% Example 3 - this diverged, indicating instability

% Example 4 - here we need to pass alpha and Omega1 to both functions
h = @(t    )h4(t    ,0.1,pi/4);
H = @(Omega)H4(Omega,0.1,pi/4);
doExample(h,H, 'h(t) = exp{-\alpha{t}} sin(\Omega_{1}{t}) u(t), \alpha > 0')

% Function to do a full example
function doExample(impulseResponseHandle, transferFunctionHandle, titleString)
N = 2000; % number of points to plot
t = linspace(0,25,N); % causal system, up to specified seconds
dt = t(2)-t(1);
Omega = pi/2; % radians/s
x = sin(Omega*t);

% Part a: convolution approach
h = impulseResponseHandle(t);
y = conv(x,h)*dt; y=y(1:N); % keep only first N samples of y so it aligns with other signals
% conv performs a *digital* convolution (more in EE3221 next term),
% but we can approximate the *analog* convolution by scaling by dt.

% Part b: system transfer function / eigenfunction approach
H = transferFunctionHandle(Omega);
yss = abs(H) * sin(Omega*t + angle(H));

figure
plot(t,h,t,x,t,y,t,yss)
legend('h(t)','x(t) = sin(\Omega{t})','y(t) = x(t)*h(t)','y_{ss}(t) = |H|sin(\Omega{t}+\angle{H})')
title(titleString)
end % function doExample

% Example 1: h = u(tau) - u(tau-1), unit pulse
function h = h1(t)
h = double(t < 1); % we assume t >= 0 because of how we set up t; convert logical(boolean) to double
end % function

function H = H1(Omega)
H = 1j/Omega*(exp(-1j*Omega)-1); % formula derived in class
end % function

% Example 2: h = e^(-alpha tau) u(tau), alpha > 0
function h = h2(t, alpha)
h = exp(-alpha*t) .* (t>=0);
end

function H = H2(Omega, alpha)
H = 1/(alpha+1j*Omega);
end

% Example 4: h = exp(-alpha t) sin(Omega1 t) u(t), alpha > 0
function h = h4(t, alpha, Omega1)
h = exp(-alpha*t).*sin(Omega1*t).*(t>=0);
end

function H = H4(Omega, alpha, Omega1)
H = Omega1 / (Omega1^2 + (alpha + 1j * Omega)^2);
end
