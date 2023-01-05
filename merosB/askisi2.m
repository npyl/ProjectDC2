M = 4;
Lb = 10000;

% dyadiki akolouthia
bits = randsrc(10^4, 1, [0, 1]);

% M-PAM

S_m = mapper(bits, M);
S_t = M_PAM(S_m, M);

for snr = 0:2:20
    S_final = S_t + noise(snr, M, Lb, size(S_t));
end