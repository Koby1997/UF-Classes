function H = freq_resp(b, w)

    H = 0;
    
    for a = 0 : length(b) - 1
       H = H + (b(a) * exp(-j*w*a));
    end

end