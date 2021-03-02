function [b a] = notch(w0, alpha);
    
    a = [1, (alpha/exp(j*w0))+(alpha*exp(j*w0)), alpha^2];
    b = [1, (exp(-j*w0))+(exp(j*w0)), 1];
    
end