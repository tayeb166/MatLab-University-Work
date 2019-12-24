function [ fric ] = friction( e,D,Re )
%friction calculates and returns the value of friction factor given surface
%roughness, pipe diameter and Reynolds number
%Inputs:
    %e = surface roughness (in m)
    %D = pipe diameter (in m)
    %Re = reybnolds number of the flow (dimensionless)
%Outputs:
    %f = friction factor
    %Name: Tayeb Al-Shedayfat
%100957964

if e<=0 || D<=0 || Re<=0
    error ('All values must be greater than zero')
else

calcfriction1=@(f,e,D,Re) -2*log10(((e/D)/3.7)+(2.51/(Re*sqrt(f))));
calcfriction2=@(f) calcfriction1(f,e,D,Re)-(1/sqrt(f));
fric = fzero(calcfriction2, [0.01 100000]);
   

end

