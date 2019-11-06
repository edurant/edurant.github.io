% EE3032 - Dr. Durant - 2017-09-20 - Quiz 2 Problem 1 Example

t = linspace(-2,2,1024); % start, end, number of points

% parameters from quiz...
w = 4*pi; % omega
d = 1; % delay/shift right, seconds; negative for advance/shift left

% interesting parameters to try: w = 4; d = 0.1;

x = sin(w*t); % input function
xf = sin(w*-t); % folded only
y = sin(w*-(t-d)); % delay, shift right, equivalently sin(-w*t+w*d)
y2 = sin(w*-(t+d)); % advance, shift left

plot(t,x,t,xf,t,y,t,y2)
legend('x(t)','x(-t) (fold)','y(t) (fold and delay)','y_2(t) (fold and advance')
titleString = sprintf('sin(\\omega\\times{t}) and variations, \\omega=%g, delay=%g', w, d);
title(titleString)
% Usually you'd just put the expresion for titleString in the call to
% title(), but I did it this way so you can look at the resulting titleString