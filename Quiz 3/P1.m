%ECOR 2606 Fall 2015 - Quiz 3
%Name: Tayeb Al-Shedayfat
%Student number: 100957964

%Defining Constants
k=500000;%spring stiffness
m=2000;%car mass
c=28000;%damping coefficient of damper

%defining anonymous function ratioXY
ratioXY=@(w) sqrt(((c*w)^2+k^2)/((k-m*w^2)^2+(c*w)^2));

%defining maximizing function
ratiomax=@(w) -ratioXY(w);

%defining max ratio
maxratio = fminbnd(ratiomax,10,20);

%defining maxXY;
maxXY = ratioXY(maxratio);

%plotting ratio vs w
figure(1);
fplot(ratioXY, [0 50]);
title('Ratio vs Omega(w)');
xlabel('Omega (w) (radians/s)');
ylabel('RatioXY (Dimensionless))');
grid on

%printing the values
fprintf('The frequency that gives maximum ratio = %.3f \nThe value of ratio at that point is = %.3f\n',maxratio,maxXY);
%finding at what the ratio is equal to 1.4
%defining root finding function
omegaroot=@(w) ratioXY(w) - 1.4;
%defining the first root
first=fzero(omegaroot,[5 15]);
second=fzero(omegaroot,[15 20]);

%printing values
fprintf('The ratio is 1.4 at the ratios %.3f and %.3f\n',first,second)

