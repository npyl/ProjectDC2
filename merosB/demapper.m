function new_bits = demapper(new_S_m, M, gray)

    if (gray == 1)
    	new_S_m     = gray2bin(new_S_m, 'pam', M);
    end
    
    M_bits      = dec2bin(new_S_m);
    new_bits    = reshape(M_bits', log2(M) * length(new_S_m), 1);
    new_bits    = str2num(new_bits);

end