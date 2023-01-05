function ber1 = ber(bits,new_bits)
    idx     = find(bits ~= new_bits);
    ber1    = length(idx) / length(bits);
end