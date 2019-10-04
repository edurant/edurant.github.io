% EE3032 - Dr. Durant - W1 Example complex exponential
A = 0.9 * exp(j*pi/6)
a = -0.1 + 1j * 0.5
t = linspace(-10,10,1000);
x = A * exp(a*t);

plot(t,real(x),t,imag(x))
legend('Re','Im')
