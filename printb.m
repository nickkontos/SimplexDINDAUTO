function y = printb(b)

    btbl=cell(size(b,1)+1,size(b,2));
    btbl{1,1} = sprintf('stock');
    for l=1:size(b,1)
        for k=1:size(b,2)
            btbl{l+1,k} = b(l,k);
        end
    end
    y=btbl;
    
end