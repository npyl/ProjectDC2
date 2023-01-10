L = 100;
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

% --------------------------------
%   Erwtima 1)
% --------------------------------

output = zeros(length(N), length(y1));

% ta PCM gia tin AR1(1)
figure(1);

% gia kathe N ftiaxnw kampyli sto figure
for i=1:length(N)
    sqnr = zeros(length(N), 1);

    [xq, centers, D] = Lloyd_Max(y1, N(i), min(y1), max(y1));
    output(i, :) = centers(xq);

    % erwtima 1.2) get probabilities & calculate entropy
    prob = probabilities(output(i, :));
    H(i) = entropy(prob);

    % erwtima 1.1a) SQNR (dB) ana j-osti epanalipsi
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

% erwtima 1.1b) grafiki gia ta outputs
figure(2);
plot(1:length(output(1,:)), output(1,:), color(1));
hold on;
plot(1:length(output(2,:)), output(2,:), color(2));
hold on;
plot(1:length(output(3,:)), output(3,:), color(3));
hold on;
ylabel('output');
xlabel('epanalipsi');
legend('2-PAM', '4-PAM', '8-PAM');
title('outputs AR1(1)');
hold off;

% ta PCM gia tin AR2(1)
figure(3);

output = zeros(length(N), length(y2));

% gia kathe N ftiaxnw kampyli sto figure
for i=1:length(N)
    sqnr = zeros(length(N), 1);

    [xq, centers, D] = Lloyd_Max(y2, N(i), min(y2), max(y2));
    output(i, :) = centers(xq);

    % erwtima 1.2) get probabilities & calculate entropy
    prob2 = probabilities(output(i, :));
    H(i) = entropy(prob);

    % erwtima 1.1a) SQNR (dB) ana j-osti epanalipsi
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

% erwtima 1.1b) grafiki gia ta outputs
figure(4);
plot(1:length(output(1,:)), output(1,:), color(1));
hold on;
plot(1:length(output(2,:)), output(2,:), color(2));
hold on;
plot(1:length(output(3,:)), output(3,:), color(3));
hold on;
ylabel('output');
xlabel('epanalipsi');
legend('2-PAM', '4-PAM', '8-PAM');
title('outputs AR2(1)');
hold off;

% ADM
A = interp(x, 2);
x_ADM = ADM(A);

% ----------------------------------
%   erwtima 2) 2-PCM, 4-PCM gia to cameraman.mat
% ----------------------------------

N = [2, 4];

load cameraman.mat
x = i(:);
x = (x - 128) / 128;    % x range from [0:255] to [-1:1]

figure(5);

output = zeros(length(N), length(x));

% gia kathe N ftiaxnw kampyli sto figure
for i = 1:length(N)
    sqnr = zeros(length(N), 1);

    [xq, centers, D] = Lloyd_Max(x, N(i), min(x), max(x));
    output(i, :) = centers(xq);

    % erwtima 2.2) get probabilities & calculate entropy
    prob = probabilities(output(i, :));
    H(i) = entropy(prob);

    % erwtima 2.1a) SQNR (dB) ana j-osti epanalipsi
    for j = 1:length(D)
        sqnr(j) = 10 * log10(mean(x.^2) / D(j));
    end

    plot(1:length(D), sqnr, color(i));
    hold on;
end

ylabel('SQNR (dB)');
xlabel('epanalipsi');
legend('2-PAM', '4-PAM');
title('PCM gia cameraman.mat');
hold off;

% erwtima 2.1b) deixnw tis eikones meta tin epeksergasia
figure;
show_image(output(1, :));
figure;
show_image(output(2, :));