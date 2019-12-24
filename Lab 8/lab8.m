%ECOR2606 LAB 8
%Name: Tayeb AL-Shedayfat
%#:100957964

%Part 1:
fprintf('\nPart 1.\n-------\n')
%a)
W = [70 75 77 80 82 84 87 90];
A = [2.10 2.12 2.15 2.20 2.22 2.23 2.26 2.30];

%b)
% transposing the equaion --> logA = d*logW + logc
lW = log10(W); 
lA = log10(A);
%fitting a straight line:
p = polyfit(lW,lA,1);
%equation of the line:
f = @(lW) polyval(p,lW);
%Outputting the result
fprintf('The equation of the line is %f logW + %f.\n',p)

%c)
figure(1)
plot(lW,lA,'xr')
hold on
fplot(f,[1.8 2])
title('Linear plot of Transformed Data')
xlabel ('Log W')
ylabel ('Log A')
grid on
hold off

%d)correlation coefficient calculation and outputting the data:
fprintf('Correlation coefficient of the transformed data is %f.\n',correlate(lW,lA,f))

% e)
c = 10^p(2);
d = p(1);
%Defining an anynomous function
g = @(w) c*w^d;
%Output data using fprintf
fprintf('The equation is: A = %f w ^ %f.\n',c,d)

% f) 
%Plot orgiginal data and fitted line
figure(2)
plot(W,A,'xr')
hold on
fplot(g,[60 100])
title('exponential plot of original data')
xlabel ('W')
ylabel ('A')
grid on
hold off

%g)correlation coefficient calculation for the line
fprintf('Correlation coefficient of the original data is %f.\n',correlate(W,A,g))

% h)Finidng the surface area of a 78.5 kg:
fprintf('The surface area of a person with 78.5 kg weight is the following %fm^2.\n',g(78.5)) 


%Part 2:
fprintf('\nPart 2.\n-------\n')

%a) defining the matrices:
x = [3 4 5 7 8 9 10 11];
y = [1.6 3.6 4.4 3.4 2.2 2.8 3.8 4.6];

%b)Fitting a cubic polynomial
p2 = polyfit(x,y,3);
h = @(x) polyval(p2,x);
%Using fprintf to output the data
fprintf('The cubic for this set of data is: %fx^3 + %fx^2 + %fx + %f.\n',p2)

%c)Plotting along [2 12]:
figure(3)
plot(x,y,'xr')
hold on
fplot(h,[2 12])
title('Cubic Plot of The Data')
xlabel ('X')
ylabel ('Y')
grid on
hold off

%d)Outputting the correlation coefficient
fprintf('The correlation coefficient of the cubic is %f.\n',correlate(x,y,h))

%e)Defining the negative of the function to use fminbnd to find the maximum
hn = @(x) -h(x);
mimm = fminbnd(hn,3,8);
fprintf('Using fminbnd, the maximum of the function is at x = %f,and equal to y = %f.\n',mimm,h(mimm))

%f)Using derivative techique to find maximum
%Defining the derivative
p3 = polyder(p2);
%Defining the derivative function
hp = @(x) polyval(p3,x);
%Defining the root finding function
dmm = fzero(hp,[3 8]);
%Outputting the results
fprintf('The maximim using polyder&fzero is at x = %f,and equal to y = %f.\n',dmm,h(dmm))

%Part 3:
fprintf('\nPart 3.\n-------\n')

%a)Defining the data:
t = [0.5 1 2 3 5 6 7 8 9 ];
pop = [6.0 4.4 3.2 2.7 2.2 1.9 1.7 1.4 1.1];

%b)Calculating the Z matrix:
Z = zeros(length(t),3);
for i = 1:length(t)
    Z(i,1) = exp(-1.5*t(i));
    Z(i,2) = exp(-0.3*t(i));
    Z(i,3) = exp(-0.05*t(i));
end
%Outputting the matrix:
Z

%c)Calculating the answer using normal equation
Zt = Z';
a1 = (Zt*Z)\(Zt*pop');
fprintf('Using normal equations the answer is: pop(t) = %fe^(-1.5t)+%fe^(-.3t)+%fe^(-.05t)\n',a1)

% d)Calculating using QR decomposition
[Q0,R0] = qr(Z,0);
a2 = R0\(Q0'*pop');
fprintf('Using QR decomposition the answer is: pop(t) = %fe^(-1.5t)+%fe^(-.3t)+%fe^(-.05t)\n',a2)

%e)Calculating the answer using left division
a3 = Z\pop';
fprintf('Using left division the answer is: pop(t) = %fe^(-1.5t)+%fe^(-.3t)+%fe^(-.05t)\n',a3)

% f)Plotting the function and data
%Defining the anynomous function:
i = @(t) a3(1)*exp(-1.5*t)+a3(2)*exp(-.3*t)+a3(3)*exp(-.05*t);
figure(4)
plot(t,pop,'xr')
hold on
fplot(i,[0 10])
title('Plot of Population Data and Fitted Curve')
xlabel ('Time (hrs)')
ylabel ('Population (millions)')
grid on
hold off

% g) correlation coefficient
fprintf('The correlation coefficient for part 3 is %f.\n',correlate(t,pop,i))
