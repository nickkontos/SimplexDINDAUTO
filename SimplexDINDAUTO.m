function SimplexDINDAUTO(A,b,f,type,min_max)

% This function and its companions implement the Simplex method
% that is used to solving linear programming problems with the 
% following format
%   min/max f'x
%   s.t.   Ax {>=, <=} b
%   x >= 0
%
% Designed to solve simple linear problems in the 
% Management and Decision course of the Digital
% Industry Departemnt of UoA
% 
%
% 14 February 2022
% Nikolaos Kontos
% National and Kapodistrian University of Athens 
% Department of Automation Engineering

min_dual=min_max;
if (min_dual==1),
    disp('Converting minimization problem to maximization');
    disp(' ');
    A=transp(A);
    b=transp(b);
    f=transp(f);
    temp=f;f=b;b=temp;
end

if (type==1),
    ses=eye(size(A,1)); 
else
    ses=-eye(size(A,1));
end

%Lower and upper bounds of variables
lb=zeros(size(A,2) ,1);
%ub=[1e4;1e4;1e4];

Z=0;
shadowprcs=zeros(1,size(A,1));
%display the input tables nicely
cA=printx(A);cb=printb(b);cses=printS(ses);

ftbl=num2cell(f);cZ=num2cell(Z);
disp('input');disp([cA,cb;ftbl,Z])

f=-f; 
ftbl=num2cell(f);
cshadowprcs=num2cell(zeros(1,size(A,1)));
%display the initial construct table nicely
disp('initial contruct');disp([cA,cses,cb;ftbl,cshadowprcs,cZ])

iter=0;

while any(f<0) && iter<5
    
    %determine driver column
    [M,driverclm] = min(f(1:size(f,2)));
    %determine driver row
    myminimum=b(1:size(A,1))./abs(A(:,driverclm));
    [M,driverrw] = min(myminimum);
    %determine driver value
    driverVal=A(driverrw,driverclm);
    
    %put it all in a table
    tb=[A ses b; f shadowprcs Z];
    
    %it's better than tablenewtemp2new trust me
    temp=tb;
    temp(driverrw,:)=tb(driverrw,:)./driverVal;
    
    %new values calculations
    for l=1:size(tb,2)
        for k=1:size(tb,1)
            tbnew(k,l) = tb(k,l)-(tb(driverrw,l)*tb(k,driverclm))/driverVal;
        end
    end
    
    tbnew(driverrw,:)=temp(driverrw,:);
    tbnew(:,driverclm)=zeros(size(tb,1),1);
    tbnew(driverrw,driverclm)=1;
    
    %table deconstruction
    A=tbnew(1:size(A,1),1:size(A,2));
    b=tbnew(1:size(A,1) , size(A,2)+size(ses,2)+1:size(A,2)+size(ses,2)+1);
    f=tbnew(end:end,1:size(A,2));
    ses=tbnew(1:size(A,1) , size(A,2)+1:size(A,2)+size(ses,2));
    shadowprcs=tbnew(end:end,size(A,2)+1:end-1);
    Z=tbnew(end:end,end:end);
    
    iter=iter+1;
    disp(['iteration number ' ,num2str(iter), ' of simplex' ])
    justprintit(A,b,f,ses,shadowprcs,Z);
end    

disp(['Optimal solution found in  ',num2str(iter),' iterations of simplex' ]);
disp([' ']); 

 if (min_dual==1),
 A=transp(A);
 b=transp(b);
 f=transp(f);
 temp=f;f=b;b=temp;
 solution_vector=flip(-shadowprcs(1:1,end-size(b,1)+1:end));
% disp(['Your choice: PAIN  ']);
% disp(['...  ']); 
 disp(['..Your choice: minimization  ']);
 disp(' ');
 sl=num2cell(solution_vector');
 disp(['Solution vector is :']);
 disp(sl);
 disp(['Minimized cost =  ',num2str(Z)]);
 end
 
end 
