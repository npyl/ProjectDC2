function s = mapper(bits, M, gray)

    a = bits(1:log2(M) * floor(length(bits) / log2(M)));
    step = log2(M);
    b = floor(length(bits)/log2(M));

    bits_reshape = reshape(a, step, b)';
    s = bin2dec(num2str(bits_reshape));

    if (gray)
        s = bin2gray(s, 'pam', M);
    end
end