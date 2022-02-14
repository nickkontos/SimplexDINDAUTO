function justprintit(A,b,f,ses,shadowprcs,Z)

    cA=printx(A);cb=printb(b);cses=printS(ses);
    ftbl=num2cell(f);
    cshadowprcs=num2cell(shadowprcs);
    cZ=num2cell(Z);
    disp([cA,cses,cb;ftbl,cshadowprcs,cZ])

end