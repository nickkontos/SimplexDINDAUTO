function y = printS(ses)

    sestbl=cell(size(ses,1)+1,size(ses,2));
    for k=1:size(ses,2)
        sestbl{1,k} = sprintf('s%g',k);
    end
    for l=1:size(ses,1)
        for k=1:size(ses,2)
            sestbl{l+1,k} = ses(l,k);
        end
    end
    y=sestbl;
    
end