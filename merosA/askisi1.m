L = 5;
x = randn(L, 1);

a1 = 0.9;
a2 = 0.01;
b = 1;

% AR1
a = [1 -a1]';
y1 = filter(b, a, x);

% AR2
a = [1 -a2]';
y2 = filter(b, a, x);

% PCM bits
N = [2, 4, 8];

color = ['r', 'g', 'b'];

% ta PCM gia tin AR1
figure(1);

% gia kathe N ftiaxnw kampyli sto figure
for i=1:3
    sqnr = zeros(length(N), 1);
    output = zeros(length(N), length(y1));

    [xq, centers, D] = Lloyd_Max(y1, N(i), min(y1), max(y1));
    output(i, :) = centers(xq);

    % SQNR (dB) ana j-osti epanalipsi
    for j = 1:length(D)
        sqnr(j) = 10 * log10(mean(y1.^2) / D(j));
    end

    plot(1:length(D), sqnr, color(i));
    hold on;
end

ylabel('SQNR (dB)');
xlabel('epanalipsi');
legend('2-PAM', '4-PAM', '8-PAM');
title('AR1(1)');
hold off;

% ta PCM gia tin AR2
figure(2);

% gia kathe N ftiaxnw kampyli sto figure
for i=1:3
    sqnr = zeros(length(N), 1);
    output = zeros(length(N), length(y2));

    [xq, centers, D] = Lloyd_Max(y2, N(i), min(y2), max(y2));
    output(i, :) = centers(xq);

    % SQNR (dB) ana j-osti epanalipsi
    for j = 1:length(D)
        sqnr(j) = 10 * log10(mean(y2.^2) / D(j));
    end

    plot(1:length(D), sqnr, color(i));
    hold on;
end

ylabel('SQNR (dB)');
xlabel('epanalipsi');
legend('2-PAM', '4-PAM', '8-PAM');
title('AR2(1)');
hold off;

% ADM
A2 = interp(x, 2);
A2q = ADM(A2);