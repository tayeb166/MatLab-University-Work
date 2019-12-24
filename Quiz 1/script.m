%ECOR2606 L8 Quiz #1
%Student Name: Tayeb Al-Shedayfat
%Student Number: 100957964

%assuming values for constants
u=1.95*10^(-5);
p=1.09;
D=0.01;

%PART i
%Cd is drag coefiecnt which is dependant variable
%V is velocity which is indenpenat variable
%anonymos function to calculate the value fo drag coefficient
f=@(V) ((24*u)/(p*V*D))+(6/(1+sqrt((p*V*D)/(u))))+0.4;

%using fplot to plot function f along [1.8 180]
figure(1)
fplot(f, [1.8 180]);
grid on
title('Drag Coefficient of a sphere according to velocity using fplot');
xlabel('Velocity (m/s)');
ylabel('Drag Coefficient (dimensionless)');

%Using plot to plot the funcion
%let s be a vector containing the values form 1.8 to 180
s = linspace(1.8,180);
y = size(s);
%for loop to calculate and save the values in a vector y
for i = 1:length(s)
    y(i)=f(s(i));
end

%plotting the two vectors against each other
figure (2);
plot(s,y,'m');
grid on
title('Drag Coefficient of a sphere according to velocity using plot');
xlabel('Velocity (m/s)');
ylabel('Drag Coefficient (dimensionless)');

%PART ii
%defining a function to calulate the root at 0.43
g =@(V) f(V)-0.43;
%using fzero to calculate and retun the value of velocity at which drag is
%0.43
r = fzero(g, [70 80]);
%outputting the answer using fprintf
fprintf('The velocity at which the drag coefficient is 0.43 is: %f\n',r)

