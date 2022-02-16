clc; clear all;

%--------------------------INPUT & OPTIONS----------------------------
%recommended general option:
%format shortg;        %decimal output
format rat;            %ration output

%Main input:
%[A]{x}={b} inequality constraints 
A=[4 3;2 4;1 1];
%Are your constraints of the <= type?
type=1; %"<=" --> type=1 ;">=" --> type=0

b=[8;12;3];

f=[4 3]; %coefficients of the objectve function


%Problem type:
min_max=0; %Maximization --> 0 ; Minimization --> 1

%--------------------------INPUT & OPTIONS----------------------------

%Function calling
SimplexDINDAUTO(A,b,f,type,min_max)


%Some more examples
disp('----------------------------------------------------------------')
A=[1 0.5 2; 1 1.5 1.2]; 
b=[53;45];
f=[140 100 200];
type=1; min_max=0;
SimplexDINDAUTO(A,b,f,type,min_max)

disp('----------------------------------------------------------------')
A=[3 1 1; 1 -1 2;1 1 -1]; 
b=[180;30;60];
f=[4 -2 2];
type=1; min_max=0;
SimplexDINDAUTO(A,b,f,type,min_max)

%Minimization example with constraints of the ">=" type
disp('----------------------------------------------------------------')
A=[1 0 2 2 1 2;0 1 3 1 3 2];
b=[9;19];
f=[1.05 0.90 1.80 1.50 0.75 0.66];
type=0; min_max=1;
SimplexDINDAUTO(A,b,f,type,min_max)
