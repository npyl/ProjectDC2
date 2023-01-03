function s = mapper(bits, M)

    a = bits(1:log2(M) * floor(length(bits) / log2(M)));
    step = log2(M);
    b = floor(length(bits)/log2(M));

    bits_reshape = reshape(a, step, b)';
    s = bin2dec(num2str(bits_reshape));
end