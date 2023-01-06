function xq = ADM (x)
    d = zeros(length(x),1); % Dianysma apothikeusis bimaton
    d(1) = 0.005;
    K =1.5;
    
    %Kodikopoiisi
    e(1) = x(1);
    b(1) = sign(e(1));
    eq(1) = d(1) * b(1);
    xcoded(1) = eq(1);
    
    for i = 2:length(x)
        e(i) = x(i) - xcoded(i-1);
        b(i) = sign(e(i));
        
        if b(i) == b(i-1)
            d(i) = d(i-1) * K;
        else
            d(i) = d(i-1) * (K^(-1));
        end
        
        eq(i) = d(i) * b(i);
        xcoded(i) = xcoded(i-1) + eq(i);
    end

    % Apokodikopoiisi
    edec = b.*d';
    xq(1) = edec(1);
    for i = 2:length(x)
        xq(i) = edec(i) + xq(i-1);
    end
end