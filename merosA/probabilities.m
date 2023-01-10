function pos = probabilities(data)

    symbols = [];
    pos = [];

    % Βρίσκουμε το αλφάβητο και τις πιθανότητες
    % Για κάθε χαρακτήρα του input της πηγής βρίσκουμε το πόσες φορές
    % εμφανίζεται, υπολογίζουμε την πιθανότητα και τον προσθέτουμε μόνο μία στο symbols.
    for i = 1:length(data)
        exists = 0;             % flag για να ελέγξουμε εάν υπάρχει το symbol ήδη στο symbols array
        times = 0;              % πόσες φορές εμφανίζεται στο κείμενο το συγκεκριμένο σύμβολο
        c = data(i);

        for k = 1:length(symbols)
            if c == symbols(k)
                exists = 1;
                break;
            end
        end

        if ~exists
            symbols = [symbols data(i)];

            % ας βρούμε πόσες φορές εμφανίζεται
            for j = (i + 1):length(data)
                if c == data(j)
                    times = times + 1;
                end
            end

            p = times / length(data);
            pos = [pos p];
        end
    end

end