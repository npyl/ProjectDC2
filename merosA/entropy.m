function H = entropy(prob)
    H = 0;

    for i = 1:length(prob)
        H = H - (prob(i) * log2(prob(i)));
    end
end