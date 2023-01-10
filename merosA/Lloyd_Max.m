function [xq,centers,D] = Lloyd_Max(x, N, min_value, max_value)
x(x>max_value) = max_value;
x(x<min_value) = min_value;
 
epsilon=10^(-4);
points = 2^N;
n = length(x);

% pairnei ta kentra pou antistoixoun se ena omoiomorfo kbantisti (paradoxi apo ekfwnisi)
[xq,centers] = my_quantizer(x,N,min_value,max_value);

Kmax=20;
D = zeros(Kmax,1);
k=1;
D(k) = (1/n)*sum((x-centers(xq)).^2);
T=zeros(length(centers)-1,1);
 
while(k<Kmax)
    k=k+1;
    for i=1:points-1
        T(i) = (centers(i)+centers(i+1))/2;
    end; 
    %kvantish shmatos
    for i=1:n
        for j=1:points
            if (j<=points-1)
                if(x(i)>=T(j))
                    xq(i) = j;
                    break;
                end;
            end;
            if (j==points)
                xq(i) = j;
            end;
        end;
    end;
 
    for j=1:points
        if (sum(xq==j)>0)
            centers(j)=0;
            break;
        end;
    end;
    
    for i=1:n
        for j=1:points
            if (xq(i)==j)
                centers(j) = centers(j)+x(i);
                break;
            end
        end;
    end;
    
    for i=1:points
        if (sum(xq==i))
            centers(i)=centers(i)/sum(xq==i);
        end;
    end;
    
    D(k) = (1/n)*sum((x-centers(xq)).^2);
    if (abs(D(k-1)-D(k))<epsilon)
        break;
    end;
 
end;
D=D(1:k);

end
