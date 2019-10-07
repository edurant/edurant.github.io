%w9d2(N) - scalar, use N random points
%w9d2(x) - data series with >= 2 given points
% sinc Reconstruction example; based on math. in Section 8.2.4 of text
% Dr. Durant, EE3032, W9D2, 2017-10-29
% Also try this x: N=24;n=0:N-1;x=2*cos(pi/4*n)+sin(pi/3*n);
% Try shorter and longer durations N.
% Reconstructed signal is abruptly forced to 0 outside at sample points outside of the domain. Note the effect this has within the domain.
function w9d2(arg)

% Need to set up 2 variables based on inputs
% N = number of points in digital signal
% x = a vector containing the digital signal

% Interpret input arg and set up N and x accordingly
if nargin==0 % no input arguments
    N = 10; % default
elseif isscalar(arg) % input arg is N
    N = arg;
else % input arg is x
    x = arg;
    N = length(arg);
end
if nargin==0 || isscalar(arg) % user did not specify x, so use random signal on [-1,1]
    x = 2*rand(1,N)-1; % Map rand = [0,1] -> [-1,1]; 1 row, N columns
end

xmax = 1.5 * max(abs(x)); % plot a bit beyond the maximum magnitude of the samples
n = 0:N-1; % Number of each sample

% Simulate analog reconstruction
Nper = 10; % Number of periods in the sinc interpolator
dtSinc = 0.01;
tSinc = -Nper : dtSinc : Nper; % sinc goes on forever, but we estimate with Nper periods
% To simplify, and without loss of generality (WLOG), we let Ts = 1 s. Then fs = 1/Ts = 1 Hz.
hlp = sinc(tSinc); % Dropped pi* inside sinc due to MATLAB's unusual argument scaling

figure
hx = plot(n,x,'ro'); % keep handle (like reference or pointer) to series so we can label it later
axis([-Nper N-1+Nper -xmax xmax]) % x goes from n=0..N-1, but the sinc interpolant goes Nper outside of that range
hold on % makes plot commands accumulate data series instead of replacing the old ones
% Draw the interpolating function for each point
tInterp = -Nper : dtSinc : N-1+Nper;
xInterp = zeros(size(tInterp));
for idx = 1:N
    tTemp = tSinc+n(idx); % shift to current sample time
    xTemp = hlp*x(idx); % scale sinc by value sample value
    hi = plot(tTemp,xTemp,'g-'); % green line, it's okay that handle gets overwritten every time; we only need one (any one) to label it)
    startIdx = find(tInterp == tTemp(1)); % Find scalar index into tInterp where tTemp starts, that is, where the sinc interpolant for the current data point starts.
    range = startIdx : startIdx+length(tTemp)-1; % The time range within tInterp and xInterp that corresponds to the current tTemp (sinc domain)
    xInterp(range) = xInterp(range) + xTemp; % Accumulate the current interpolant; MATLAB doesn't have +=
end, clear tTemp xTemp startIdx range % remove some loop temporary variables from memory; MATLAB doesn't have {}-scope like C/C++/Java
hxi = plot(tInterp,xInterp,'k-');
legend([hx hi hxi], 'Original samples of x(t)', 'sinc interpolants', 'Reconstructed x(t)')
