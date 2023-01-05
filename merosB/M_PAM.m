%
%   M-PAM Modulation
%
function S_t = M_PAM(symbols, M)
    Tsymbol = 40;

    Tc = 4;
    fc = 1/Tc;

    Es = 1;     % gia gT(t), iso me 1 apo ekfwnhsi

    A = 0;      % platos
    m = symbols + 1;

    % ------------
    % define gT(t)
    % ------------
    t = 1:Tsymbol;  % pedio orismou ths gT opou isxyei o parakatw typos:
    gT = sqrt(2*Es / Tsymbol);

    % Calculate A (amplitude)
    for i = 1:M
        A = A + (2*i + (M + 1)).^2;
    end
    A = 1 / sqrt(A/M);

    for i = 1:length(m)
        Am = (2*m(i) - (M+1))*A;        % Auto antistoixei sto Sm sthn ekfwnisi (Typos (1))

        S_t(i,:) = Am * gT * cos(2 * pi * fc * t);
    end
end