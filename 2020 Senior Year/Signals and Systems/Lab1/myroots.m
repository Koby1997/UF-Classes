function r = myroots (n , a)
% myroots : Find all the nth roots of the complex number a
%
% Input Args :
% n : a positive integer specifying the nth roots
% a : a complex number whose nth roots are to be returned
%
% Output :
% r : 1 xn vector containing all the nth roots of a

A = abs(a);     % A is magnitude of a
phi = angle(a); % phi is phase angle of a
r1 = (A^(1/n)) * exp(j*phi/n); % find r1
k = [0:1:n-1];  % make vector for each k we need to find each root 
r2 = exp(j * 2 * pi * k / n ); % find r2
r = r1 * r2;    % multiply r1 by every value in r2 to get all roots.