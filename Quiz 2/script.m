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

