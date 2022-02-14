function y = printx(x)
    
    Atbl=cell(size(x,1)+1,size(x,2));
    for k=1:size(x,2)
        Atbl{1,k} = sprintf('x%g',k);
    end
    for l=1:size(x,1)
        for k=1:size(x,2)
            Atbl{l+1,k} = x(l,k);
        end
    end
    y=Atbl;
    
end