function y = reverb_conv(x, s, A)
% finds the impulse response h and then convolse the given x with h
a = [1];
b = [1,A];

x_size = size(x,1);
impulse = zeros(1,x_size);
impulse(1) = 1;

h = filter(b,a,impulse);

y = conv(h,x);

end