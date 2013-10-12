function b = cof(a) 
        for i = 1:size(a)(1)
                for j = 1:size(a)(2)
                        c = a;
                        c(i,:) = [];
                        c(:,j) = [];
                        b(i,j) = (-1)^(i+j) * det(c);
                endfor
        endfor
endfunction
