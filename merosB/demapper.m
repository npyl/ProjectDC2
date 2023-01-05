function new_bits = demapper(new_S_m, M)

    % TODO: gray
    
    M_bits      = dec2bin(new_S_m);
    new_bits    = reshape(M_bits', log2(M) * length(new_S_m), 1);
    new_bits    = str2num(new_bits);

end