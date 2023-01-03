M = [4, 8];

% dyadiki akolouthia
bits = randsrc(10^4, 1, [0, 1]);

% M-PAM
for i=1:length(M)
    m = M(i);
    
    % s(m)   
    s = mapper(bits, m);
end