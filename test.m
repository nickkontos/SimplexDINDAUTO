clc; clear all;
%--------------------------INPUT & OPTIONS----------------------------
%format shortg;        %decimal output
format rat;            %ration output
%Inequality constraints. The should be in the form [A]{x}={b}
A=[1 0 2 2 1 2;0 1 3 1 3 2];
b=[9;19];
%objectve function: input coefficients
f=[1.05 0.90 1.80 1.50 0.75 0.66];


%A=[3 1 1; 1 -1 2;1 1 -1]; %uncomment to test this too!
%b=[180;30;60];
%f=[4 -2 2];

%Is your problem a minimization problem? If so, make this var --> 1
%if not, set it to 0
min_max=0;

%Are your constraints of the <= type?
%if so, set type=1
%if >= then set type=0
type=0;
%--------------------------INPUT & OPTIONS----------------------------

%Function calling
SimplexDINDAUTO(A,b,f,type,min_max)
