function new_symbols = foratis(r, M)

    A=0;
    
    % calculate Amplitude
    for i = 1:M
        A = A + (2*i-(M+1)).^2;
    end
    A = 1/sqrt(A/M);
    
    for i = 1:length(r)
	    for m = 1:M
       	    Am = A * (2*m - (M + 1));
	        apostasi(m) = (r(i) - Am)^2;
	    end
	    
	    [min1, new_symbols(i)] = min(apostasi);
    end
    
    new_symbols = (new_symbols - 1)';
end