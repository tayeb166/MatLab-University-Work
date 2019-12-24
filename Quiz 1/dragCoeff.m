function [ Cd ] = dragCoeff( u,p,D,V )
%dragCoeff calculates and returns the value of drag coefficient given u,p,D
%and V
%   Inputs:
    %u = viscosity of fluid
    %p = density of fluid
    %D = diameter of sphere
    %V = velocity
%   Outputs:
    %Cd = drag coefficinet

%Student Name: Tayeb Al-Shedayfat
%Student Number: 100957964

%if statement to output error incase of invalid inputs
if u<=0 || p<=0 || D<=0 || V<=0
    error('Invalid inputs: all values must be greater than zero.')
end

%creating an anonymos function to calulate the value of Cd
f=@(u,p,D,V) ((24*u)/(p*V*D))+(6/(1+sqrt((p*V*D)/(u))))+0.4;

%returning the value of Cd
Cd = f(u,p,D,V);

end

