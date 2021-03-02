function y = reverb_own(x, s, A)

x_delayed = [zeros(0,s) x];
x_longer = [x zeros(0,s)];
y = x_longer + A*x_delayed;

end