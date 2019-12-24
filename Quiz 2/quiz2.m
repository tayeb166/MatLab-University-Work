function [  ] = quiz2(  )
%No out-put no input function to create graph and table
%Name: Tayeb Al-Shedayfat
%100957964

%defining the constants
e=0.0004;
D=0.1;
%Generating values of friction corresonding for a Re
Re=linspace(10000,100000);
%Pre-allocating values for f
f=zeros(size(Re));
%for loop to store values of f in a victor f
for i=1:length(Re)
    f(i)=friction(e,D,Re(i));
end

%outputing the values in plot
figure(1)
plot(f,Re,'m')
title('Friction vs. Re (10,000-100,000)')
xlabel('friction (dimensionaless)')
ylabel('Reynolds number of the flow (dimenstionless)')

%Outputting a table

fprintf('Reynolds    Friction\n')
for Re=10000:5000:100000
    fprintf('%.f  %12.5f\n',Re,friction(e,D,Re)) 
end

%sunfunction friction
function [ fric ] = friction( e,D,Re )
%friction calculates and returns the value of friction factor given surface
%roughness, pipe diameter and Reynolds number
%Inputs:
    %e = surface roughness (in m)
    %D = pipe diameter (in m)
    %Re = reybnolds number of the flow (dimensionless)
%Outputs:
    %f = friction factor
    
if e<=0 || D<=0 || Re<=0
    error ('All values must be greater than zero')
else

calcfriction1=@(f,e,D,Re) -2*log10(((e/D)/3.7)+(2.51/(Re*sqrt(f))));
calcfriction2=@(f) calcfriction1(f,e,D,Re)-(1/sqrt(f));
fric = fzero(calcfriction2, [0.01 100000]);
   

end

