function noise = awgn_noise(SNR, M, size)
    % variance
    v_squared = (1 / (2 * log2(M))) * 10^((-1)*SNR/10);
    
    % return noise
    noise = sqrt(v_squared) * randn(size);
end