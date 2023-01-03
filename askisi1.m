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

% TODO: add ADM

% PCM bits
N = [2, 4, 8];

% ta PCM gia tin AR1
for i=1:3
    sqnr = zeros(length(N), 1);
    Lloyd_Max_output = zeros(length(N), length(y1));

    [xq_Lloyd_Max, centers, D] = Lloyd_Max(y1, N(i), min(y1), max(y1));
    Lloyd_Max_output(i,:) = centers(xq_Lloyd_Max);
    sqnr(i) = mean(y1.^2) / mean((y1' - Lloyd_Max_output(i,:)).^2);

    figure
    hold on
    title(sprintf('Lloyd_Max for N=%d', N(i)))
    plot(Lloyd_Max_output(i,:))
    hold off
end

% ta PCM gia tin AR2
for i=1:3
    
end