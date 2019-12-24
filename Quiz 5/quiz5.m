%ECOR2606 Fall 2015
%Quiz 5
%Name: Tayeb Al-Shedayfat
%#:100957964

%Part 1
fprintf('Part 1.\n');
%Defining the values
xv = [1.8 2.0 2.2 2.4 2.6];
Jv = [0.5815 0.5767 0.5560 0.5202 0.4708];
n = length(xv);

%Producing the interpolating polynomial
ip = polyfit(xv,Jv,n-1);
fp =@(x) polyval(ip,x);

%Producing the cubic spline
cs = spline(xv,Jv);
csf =@(x) ppval(cs,x);

%Prodcuing the plots
%Plot for interpolating polynomial
figure(1)
plot(xv,Jv,'xr')
title('x vs J1(x) "Interpolating Polynomial"')
ylabel('J1(x)')
xlabel('x')
grid on
hold on
fplot(fp, [1.8 2.6])
hold off

%plot for cubic spline
figure (2)
plot(xv,Jv,'xr')
title('x vs J1(x) "Cubic Spline"')
ylabel('J1(x)')
xlabel('x')
grid on
hold on
fplot(csf, [1.8 2.6],'k')
hold off
%The predicted values
fprintf('The predicted value for J(2.3) using polynomial interpolation is %.4f\nAnd using cubic spline its %.4f\n',fp(2.3),csf(2.3));

%Part 2
fprintf('\nPart 2.\n');
%defining the anynomus function
fx =@(x) (x.^3+7.*x).*(exp(-x));
%usign quad
IQ = quad(fx,3,9);
fprintf('The integration from 3 to 9 using quad is: %f\n',IQ);
%using trapz
xin=[3:0.25:9];
yin=fx(xin);
TI = trapz(xin,yin);
fprintf('The integration from 3 to 9 using Trapz is: %f\n',TI);

%Part 3
fprintf('\nPart 3.\n');
%Defining the constatns for 3 points qaussian quadrature
a=3;
b=9;
bass = (b-a)/2;
baa = (b+a)/2;
c0=5/9;
c1=8/9;
c2=5/9;
x0=-0.77459;
x1=0;
x2=0.77459;
%Applying the formula
p = bass*((c0*fx(baa+bass*x0))+(c1*fx(baa+bass*x1))+(c2*fx(baa+bass*x2)));
fprintf('Using 3 point Gaussian quadrature the answer is: %f\n',p);
