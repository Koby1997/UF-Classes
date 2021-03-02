function y = tremolo(x, fm, A)
% Creates tremolo effect on audio
n = [1 : size(x,1)];
y = x + (A*cos(2*pi*fm*n))*x;

end