%function noise = noise(SNR, M, Lb)
    % variance
%    v_squared = (1 / (2 * log2(M))) * 10^((-1)*SNR/10);
    
    % return noise
%    noise = sqrt(v_squared) * randn(Lb / log2(M));
%end

function noise = noise(SNR, M, Lb, size)
    Eb = 1 / log2(M);
    N_0 = Eb / (10^(SNR/10));
    noise = sqrt(N_0/2) * randn(size);
end