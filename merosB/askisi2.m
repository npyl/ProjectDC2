M = [4, 8];

% dyadiki akolouthia
bits = randsrc(10^4, 1, [0, 1]);

% M-PAM
for i=1:length(M)
    m = M(i);           % m, bits-PAM
    
    S_m = mapper(bits, m);
    S_t = M_PAM(S_m, m);

    
end