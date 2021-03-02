function X = dtft(x, w)
    X = 0;

    for a = 1 : length(x)
       X = X + (x(1,a) * exp(-1j*w*a-1));
    end
    
end