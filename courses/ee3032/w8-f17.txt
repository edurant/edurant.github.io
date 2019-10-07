% EE3032 - W8 - Dr. Durant - 2017-10-24
% Ideal filter example (p. 363-)

f1 = 50; % Hz
Omega1 = f1 * 2*pi; % low frequency cutoff
% Use Table 5.2(13), p. 383: sin(Omega0*t)/(pi*t) =
% Omega0/pi*sinc(Omega0*t) <-> u(Omega+Omega0)-u(Omega-Omega0)

% Note that the FT above is that of the ideal LPF (lowpass filter), so the time-domain
% signal is the impulse response of the ideal LPF. Let's find its values...

dt = 0.0001; % time step for calculations/graphing; for a good approximation, this should be a small fraction of the smallest period of interest
t = -1:dt:1; % time
hlp = Omega1 / pi * sinc(Omega1*t/pi); % In sinc, /pi converts from MATLAB to standard sinc definition

% And, check our work by evaluating the FT at several points
Omega = ((f1-10):(f1+10)) * 2*pi; % test frequencies near the cutoff
Hlp = NaN(size(Omega)); % allocate space for results
for i = 1:length(Omega)
    % There are much faster ways to calculate this than using a for loop - more in EE3221 (see fft function)
    Hlp(i) = sum(hlp .* exp(-1j*Omega(i)*t)) * dt; % Approximate integral with Riemann sum
end
figure
subplot(2,1,1),plot(Omega/(2*pi),abs(Hlp),'b-*'),xlabel('Frequency (Hz)'),ylabel('H_{lp}(\Omega)'),title('Lowpass response')
subplot(2,1,2),plot(t,hlp),xlim([-.15 .15]),xlabel('Time (s)'),ylabel('h_{lp}(t)')

% Now, let's do a bandpass example
fsh = 200; % Hz shift
hbp = 2 * hlp .* cos(fsh*2*pi*t); % Using modulation property, Table 5.2(14), *2 to restore gain from 1/2 to 1
% Again, evaluate the FT at several points
Omega = ((fsh-f1-10):(fsh+f1+10)) * 2*pi; % test frequencies in band and close to band edge
Hbp = NaN(size(Omega));
for i = 1:length(Omega)
    Hbp(i) = sum(hbp .* exp(-1j*Omega(i)*t)) * dt;
end
figure
subplot(2,1,1),plot(Omega/(2*pi),abs(Hbp),'b-*'),xlabel('Frequency (Hz)'),ylabel('H_{bp}(\Omega)'),title('Bandpass response')
subplot(2,1,2),plot(t,hbp),xlim([-.15 .15]),xlabel('Time (s)'),ylabel('h_{bp}(t)')
