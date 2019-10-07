%w9d4 - show effect of ZOH (zero-order hold) on an ideal impulse train
% The textbook shows this as part of the A/D, and while it is true that
% the ZOH signal exists inside a common type of A/D, it does NOT affect
% the frequency content seen by the digital samples that come out and go to
% the DSP. However, the analysis is still useful since it tells you about
% the attenuation at higher frequencies that occur in the ZOH portion of
% one of the standard D/A (not A/D) implementations, when the analog output
% is being reconstructed from the DSP's digital signal output.
% Dr. Durant, EE3032, W9D4, 2017-11-03

fs = 5; % Hz, samples/s, arbitrary, try changing
Ts = 1/fs;
OmegaSamp = 2*pi*fs;

Delta = 0 : (Ts/5) : Ts; % hold time, s

Omega = -OmegaSamp/2 : (OmegaSamp/1000) : OmegaSamp/2;
arg = Delta'*Omega/2; % argument that appears twice in H, outer product, rows are the Delta values to try, columns are the Omega values along the plot axis
H = sinc(arg/pi).*exp(-1j*arg); % don’t forget MATLAB sinc scaling, normalize plots by ignoring gain Delta, constant gain proportional to 1/Delta will be applied in the real system, nose amplification is a problem as Delta approaches 0, making truly ideal sampling not possible in practice. 

figure
subplot(2,1,1)
hm = plot(Omega,abs(H));
title(sprintf('Sample-and-hold D/A Magnitude, f_s = %g Hz, T_s = %g',fs,Ts))
ylabel('Gain (unitless, e.g., V/V)')
subplot(2,1,2)
hp = plot(Omega,angle(H));
title('Phase')
xlabel('\Omega (axis spans \pm\Omega_s/2)')
ylabel('Phase shift, negative is delay (radians)')
legend(hp([1 end]), '\Delta = 0 (ideal impulse sampling)', 'Delta = T_s (maximum hold time)')
