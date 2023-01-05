%
%   M-PAM Demodulation
%
function r = de_M_PAM(S_final)
    Tsymbol = 40;
    Tsample = 1;
    Tc = 4;
    Es = 1;
    fc = 1 / Tc;
    t = 1:Tsymbol;
    
    ferousa = sqrt(2*Es/Tsymbol) * cos(2*pi*fc*t)';
    r = S_final * ferousa;
end