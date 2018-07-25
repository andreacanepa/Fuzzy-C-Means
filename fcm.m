function [U, V, iter] = fcm(X, K, m, N_MAX, threshold, V)
    U = zeros(size(X,1),K);
    iter = 0;
    U_prec = ones(size(X,1),K);
    while ((iter < N_MAX) && (norm(U - U_prec) > threshold))
        U_prec = U;
        for i = 1:size(X,1)
            for h = 1:K
                acc = 0;
                for j = 1:K
                   val = ((norm((X(i,:) - V(h,:))))/(norm(((X(i,:) - V(j,:)))))).^(2/(m-1));
                   acc = acc + val;
                   val = 0;
                end
                U(i,h) = 1 ./ acc;
            end
        end      
        
        for i=1:size(V,1)
            num = zeros(1,size(X,2));
            den = 0;
            for h=1:size(X,1)
                num = num + ((U(h,i).^(m))*(X(h,:)));
                den = den + (U(h,i).^(m));
            end
            V(i,:) = num ./ den;
        end
        iter = iter + 1;
    end
end
