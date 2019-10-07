% EE3032 - Dr. Durant - Week 6 In-Class Exercise
% 2017-10-11 - System response

% We recently learned that the transfer function, H(j*Omega), which exists for any
% LTI system, tells about the steady state phase shift and gain/attenuation
% between an input and output at a given frequency. Saying a system is LTI is 
% equivalent to saying a transfer function, h(t), exists. Specifically, H() is a
% complex, scalar-valued function of the input frequency Omega.

% In detail, for the kth frequency component of a real, periodic signal we have
% xk(t) = 2 |X_k| cos(k Omega0 t + angle(X_k))
% Note that the cosine (along with the sine and the complex exponential) is
% an eigenfunction of any LTI system. So, the output will have the same
% frequency with the magnitude and phase changed as a function of the
% frequency. This is the full (not trigonometric) Fourier series, with complex X_k,
% simplified for real signals. Now, we can find H(j*Omega) = H(j*k*Omega0), which
% is a complex number, H_k. The output due to this component of the input,
% using the eigenfunction property is
% yk(t) = 2 |X_k| |H_k| cos(k Omega0 t + angle(X_k) + angle(H_k))

% For this exercise, you will let the system input be the square wave, for
% which we derived the FS in class. You will consider a system for which we 
% derived the transfer function in class. Thus, you have all the tools to
% compute X_k and H_k in the equation above. You will construct the output y by
% adding together several of the yk functions (since there are an infinite
% number, this is an approximation, but a good one); this will give the
% theoretical steady state response.

dt = 0.002; % Time step for calculations and plotting
t = 0:dt:3; % format is start:step:end
T0 = 1; % fundamental frequency in seconds

a = 0.3; % end time of h(t), was 1 in class example
desc = sprintf('h(t) = (u(t) - u(t-a))/a, a = %g', a); % scale so area under h is 1.
h = ((t>=0) & (t<=a)) / a;
% In class, we derived H for the a=1 case. The general solution is 
% H(j Omega) = j/(Omega a) (e^(-j Omega a) - 1)

% Also, here is the input x(t)...
x = sign(cos(2*pi/T0*t)); % sign makes this +/-1
% And, here is how we build x from its FS components. We use the first several
% non-zero terms to approximate x. You can try adding or removing components.
k = [1 3 5 7 9];
Omega = 2*pi*k/T0; % vector of Omega_0*k
X = 2./(pi*k.*(-1).^((k-1)/2)); % derived in class in week 5. In this case,
% and for all even and real signals, X_k is real, so angle(X_k)=0 or pi.
if false % Use brief and efficient, but harder to understand, method
	xm = bsxfun(@times, 2*abs(X).', cos(bsxfun(@plus, Omega'*t, angle(X).')));
    % the components of x(t), outer product, see w5.m for details
else % Inefficient loop; better for understanding and early code development
    % Allocate matrix of invalid values to hold each component function
	xm = NaN(length(k),length(t));
	for c = 1:length(k)
        % calculate the cth component, where c is an index into k (& Omega & X)
		xm(c,:) = 2*abs(X(c))*cos(Omega(c)*t+angle(X(c))); 
		% (c,:) means the cth row and the ':' column. ':' means ALL columns; 
        % we are defining the function value at ALL values of t.
	end
end
xn = sum(xm); % sum the components, arriving at our estimate of x(t)

% Now, find the complete response (transient + steady state) using convolution
yc = conv(x,h) * dt; yc = yc(1:length(t));

% Your work goes here. Find H for the 5 Omegas. Then write code for the
% scaled and phase-shifted components of y (call them ym, using the naming
% convention above). Finally, add them together into yn. This yn is the
% steady-state response when the input is xn.
ym = NaN(size(xm)); % replace these 2 lines with your code.
yn = NaN(size(xn)); % these create y of the proper size with invalid values.

% Plotting code - you don't need to change this, but may add to it if you wish.
figure
plot(t,h,t,x,t,xn,t,yc,t,yn)
legend('h(t)','x(t)','x^\wedge(t)={2}\Sigma_k{|X_k|cos(\Omega_0{k}t+\angle{X_k})}',...
    'y(t)=x(t)*h(t)',...
    'y_{ss}^\wedge(t)={2}\Sigma_k{|X_k||H_k|cos(\Omega_0{k}t+\angle{X_k}+\angle{H_k})}')
title(sprintf('Part I: %s', desc)) % refer to the description string to avoid
% having to enter/edit it in 2 places

% Study Questions
% 1. Does the output appear as you expected? Why or why not?
% 2. How does a affect the delay of the system?
% 3. How does a affect the transient settling time of the system?
% 4. Find a (finite, non-zero) a that causes y(t) = 0. Hint: this will
% happen when H(j Omega) = 0. This is called a 0 of the transfer function,
% or equivalently, a 0 of the system.

% Part II: Try this after class for extra practice.
% h(t) = e^(-at) u(t), a > 0
