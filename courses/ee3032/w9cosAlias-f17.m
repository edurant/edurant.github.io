%w9cosAlias(f,fs)
% Aliased sampling of cosine
% Dr. Durant, EE3032, W9D1, 2017-10-29
function w9cosAlias(f,fs)

% Set defaults for input arguments if user did not specify, or indicated []
if ~exist('f' ,'var') || isempty(f ), f = 30; end % frequency of input cosine (no antialias filter; AA filter would wipe out component above fs/2)
if ~exist('fs','var') || isempty(fs), fs = 40; end % sampling frequency, Hz

N = 10; % number of samples to illustrate
n = 0:N-1; % sample numbers

t_samp = n/fs; % sampling time in s
y_digital = cos(2*pi*f*t_samp); % samples of cosine

t = (0:(N*100-1))/(100*fs); % approximate continuous time; 100 is arbitrary but should be large
y_analog = cos(2*pi*f*t); % values at highly sampled, continuous approximation

% Check assumptions on the inputs before continuing; abort execution via error() if not met
if f < 0              , error('Assumption not met: positive input frequency')
elseif abs(f) <= fs/2 , error('Assumption not met: input frequency aliases') 
elseif abs(f) > fs*3/2, error('Assumption not met: 1st alias is in the baseband')
end

f_alias = fs - f; % In Hz, same as alias at digital frequency of 2pi - w0, where w0 is too-fast sinusoid
y_alias_analog = cos(2*pi*f_alias*t); % reconstructed (reconstruction filter limits to 0-fs/2 Hz, or 0-pi in digital frequency)

figure

% Plot all analog ("continuous" time) and digital (sampled) signals vs. time
subplot(211)
h = plot(t     ,y_analog      ,'b-',...
         t_samp,y_digital     ,'bo',...
         t     ,y_alias_analog,'r--');
% h is array of handles (like pointers) to the 3 traces (series) in the plot
set(h,'LineWidth',2) % Make all lines thicker; can also modify select lines, e.g., h([1 3])
set(h(2),'MarkerSize',10) % Make the circles on the 2nd series bigger
legend('Analog source','Sampled','Analog reconstructed (aliased)')
xlabel('Time (s)'), ylabel('Signal level')
title(sprintf('Aliasing Example: f = %g, fs = %g', f, fs))

% Plot frequency domain view
subplot(212)
h = plot(    [-f f], [1 1], 'ro', ...
          fs+[-f f], [1 1], 'g^', ...
         -fs+[-f f], [1 1], 'bv');
set(h,'LineWidth',2,'MarkerSize',10)
legend('Original','Periodic copy at fs (2\times\pi)','Periodic copy at -fs (-2\times\pi)')
hold on
h = plot([-fs/2 -fs/2], [0 1], 'k-', ...
         [ fs/2  fs/2], [0 1], 'k-');
set(h,'LineWidth',5)
xlabel('Frequency (Hz)'), ylabel('Signal level')
title('Frequency domain view - vertical bars indicate |f| < fs/2')

end % function
