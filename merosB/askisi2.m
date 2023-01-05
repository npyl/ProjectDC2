M = 4;
Lb = 10000;

% dyadiki akolouthia
bits = randsrc(10^4, 1, [0, 1]);

% 2)
% 4-PAM (no gray)

S_m = mapper(bits, M, 0);
S_t = M_PAM(S_m, M);

i = 1;

for snr = 0:2:20
    S_final = S_t + awgn_noise(snr, M, size(S_t));
    
    % ---- DEKTIS ----
    r               = de_M_PAM(S_final);        % apodiamorfwsi
    new_S_m         = foratis(r, M);            % symbola pou dexetai o dektis
    new_bits        = demapper(new_S_m, M, 0);

    ber_4nogray(i)  = ber(bits(1:length(new_bits)), new_bits);
    i = i + 1;
end

% 4)
% 8-PAM (with gray)

M = 8;

S_m = mapper(bits, M, 1);
S_t = M_PAM(S_m, M);

i = 1;

for snr = 0:2:20
    S_final = S_t + awgn_noise(snr, M, size(S_t));
    
    % ---- DEKTIS ----
    r               = de_M_PAM(S_final);    % apodiamorfwsi
    new_S_m         = foratis(r, M);        % symbola pou dexetai o dektis
    new_bits        = demapper(new_S_m, M, 1);

    ber_8gray(i)    = ber(bits(1:length(new_bits)), new_bits);
    i = i + 1;
end

SNR = 0:2:20;

% BER
figure(1);
semilogy(SNR, ber_4nogray, 'b');
hold on;
semilogy(SNR, ber_8gray, 'g');
hold on;
xlabel('SNR/bit (db)');
ylabel('BER');
legend('4-PAM no gray', '8-PAM with gray');