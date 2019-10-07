% EE3032 - Dr. Durant - W7D2 - Fourier transform properties - support
% 2017-10-17
% function w7d2(tau, A)
%
% In lecture, we showed that the Fourier transform of a pulse of height A
% centered at 0 and having total width tau/2 is
% X(Omega) = A tau sinc(Omega tau / 2)
% where sinc(x) is sin(x)/x, and sinc(0) = 1 by using, e.g., a Taylor
% series expansion of the sine function.

% Try typing 'help w7d2' to see how the above comments turn into MATLAB help

% Let's plot X(Omega)...
function w7d2(tau, A)
if ~exist('tau','var') % caller didn't specify tau, so use default
    tau = 1; % Relative to tau=1, |tau| > 1 is expanded in time but compressed in frequency
end
if ~exist('A','var'), A = 4; end % default for unspecified A

Omega = linspace(-3*pi,3*pi); % Omega is a continuous variable in the Fourier transform, approximated by a discrete variable in MATLAB

X = A * tau * sinc(Omega * tau / 2 / pi); % Extra /pi is because of MATLAB scaling, see doc sinc

figure
plot(Omega,X),xlabel('\Omega'),ylabel('X(\Omega)')
xticks([-3*pi -2*pi -pi 0 pi 2*pi 3*pi])
xticklabels({'-3\pi','-2\pi','-\pi','0','\pi','2\pi','3\pi'})
title(sprintf('X(\\Omega) = A\\tau{sinc}(\\Omega\\tau/2), A = %g, \\tau = %g', A, tau))

% end function