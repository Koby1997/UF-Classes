function y = reverb_filter(x, s, A)
% finds the impulse response h and uses filter with this impulse
% response and input x
a = [1];
b = [1,A];

x_size = size(x,1);
impulse = zeros(1,x_size);
impulse(1) = 1;

h = filter(b,a,impulse);

y = filter(h,1,x);

end