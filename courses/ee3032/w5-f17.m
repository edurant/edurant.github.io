% Dr. Durant - EE3032 - Week 5 Example - 2017-10-04
% Fourier series of a square wave.

% As shown in class, for a square wave x(t) (even, varying between +/-1, x(0) = 1),
T0 = 1; % seconds
% the Fourier series for non-negative k is
% X = 0, 2/pi, 0, -2/(3pi), 0, 2/(5pi), 0, -2/(7pi), ...
% Since the signal is even, we also have X_{-k} = X_k. This is true for all
% even signals, including complex ones. Note that our Fourier series here
% is real, which happens because x(t) is both real and even.

% Let's confirm by construction of the first few terms that the series is correct.

k = [1 3 5 7];
X = 2./(pi*k.*(-1).^((k-1)/2)) % display since no ;, .^ -> element-wise exponentiation
% (^ is matrix exponentiation), notice how we get the alternating +/-1 from (-1).^...
Omega = 2*pi*k/T0; % radians/second

t = linspace(-1/2, 1/2); % time vector over one period, could put in terms of T0

x = sign(cos(Omega(k==1)*t)); % ideal square wave, sign() returns +1, -1, 0
% The k and Omega vectors correspond for a given position. k==1 returns a
% vector of the size of (k or Omega) that indicates where k is 1, so
% Omega(k==1) gives us the value of Omega when k is 1, which is the
% fundamental frequency.

assert(all(isreal(X))) % We're about assume all the X are real (so we only need the cosine
% part of the basis). This will throw an error if all the X aren't real, which is better
% than calculating an incorrect result.
xm = cos(Omega'*t); % outer product; constructing a row vector signal for each k
xm = bsxfun(@times, 2*X.', xm); % scale the components by X_k, .' is NON-conjugate
% transpose; 2*, similar to the trigonometric Fourier series, adds the voltage
% contribution of X_{-k}
xn = sum(xm); % sum the k components

plot(t,x,t,xn,t,xm)
legend('Original', 'Approximated', 'Components...')

% Now try Parseval's power relation.
Px      = sum(x.^2)  / length(x)  % power = average energy over the period
Pxn     = sum(xn.^2) / length(xn)

Pxn_par = 2*sum(X.*conj(X)) % 2* adds power from k<0.
% We don't handle k=0 here, which doesn't need 2* since it contains all the DC voltage
