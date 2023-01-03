function [xq,centers] = my_quantizer(x,N,min_value,max_value)
    points = 2^N;
    n = length(x);
    limits = linspace(max_value,min_value,points+1);
    D = limits(2)-limits(1);
    xq = zeros(n,1);
    centers = zeros(points,1);
     
    x(x>max_value) = max_value;
    x(x<min_value) = min_value;
     
    for i=1:points
        centers(i) = limits(i)+0.5*D;
    end;
     
    for i=1:n
        for j=2:points
            if ((x(i)>limits(j))&&(x(i)<=limits(j-1)))
                xq(i) = j-1;
                break;
            end;
            if (j==points)
                xq(i) = 2^N;
            end;
        end;
    end;
end
