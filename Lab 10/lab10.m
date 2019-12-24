function [  ] = lab10(  )
%Name: Tayeb Al-Shedayfat
%#:100957964
%ECOR 2606 LAB 10

fprintf('Part 1:\n')
%Part b)
load SCO2.txt

%Part c)
[n, cols] = size(SCO2);
T = SCO2(:,1);
Cp = SCO2(:,6);
e = SCO2(:,3);

%Part d)
It = trapz (T(1:n), Cp(1:n));
fprintf ('Trapezoidal integration of the whole table %.0fK to %.0fK gives %f.\n',T(1),T(n),It);

%Part f)
h=T(2)-T(1);
Is = Simpson13 (h, Cp(1:n));
fprintf ('Simpsons 1/3 rule of the whole table %.0fK to %.0f gives %f.\n',T(1),T(n),Is); 

%Part g)
actual=e(n)-e(1);
fprintf ('The actual enthalpy changeof the whole table %.0fK to %.0fK is %f.\n\n',T(1),T(n),actual);

%Part h)
It2 = trapz (T(5:n), Cp(5:n));
Is2 = Simpson13 (T(2)-T(1), Cp(5:n));
fprintf ('Trapezoidal integration %.0fK to %.0fK gives %f.\n',T(5),T(n),It2);
fprintf ('Simpson''s 1/3 rule %.0fK to %.0fK gives %f.\n',T(5),T(n),Is2);
fprintf ('The actual enthalpy change %.0fK to %.0fK is %f.\n', T(5),T(n),e(n)-e(5));

%Part 2
fprintf('\nPart 2:\n') 

%Part A)
T10 = T(1:10);
cp10 = Cp(1:10);

%Part B)
figure(1)
plot(T10,cp10,'x','MarkerSize',20) 
title('The first 10 Ts and cp')
xlabel('Temprature(K)')
ylabel('Specific Heat Volume Constant')
grid on

%Part C)
figure(2)
plot(T10,cp10,'x','MarkerSize',20) 
title('The first 10 Ts and cp')
xlabel('Temprature(K)')
ylabel('Specific Heat Volume Constant')
grid on
hold on

%Linear spline (piecewise linear interpolation) in red
pp2 = interp1(T10,cp10,'linear','pp');
f3 = @(t) ppval(pp2,t);
fplot(f3,[T10(1) T10(10)],'r')
%Polynomial interpolation scalled in green
%Scalling Function first
midT = (T10(1)+ T10(10)) / 2;
halfRange = (T10(10)-T10(1)) / 2;
scale = @(T) (T - midT) / halfRange;
%Interpolating polynomial
p = polyfit(scale(T10),cp10,9);
f = @(t) polyval(p,scale(t));
fplot(f,[T10(1) T10(10)],'g')
%Cubic Spline in black
pp = interp1(T10,cp10,'spline','pp');
f2 = @(t) ppval(pp,t);
fplot(f2,[T10(1) T10(10)],'k')
hold off

%Part D)
figure(3)
plot(T10,cp10,'x','MarkerSize',20) 
title('The first 10 Ts and cp')
xlabel('Temprature(K)')
ylabel('Specific Heat Volume Constant')
grid on
hold on
fplot(f,[T10(1) T10(10)],'g')
fplot(f2,[T10(1) T10(10)],'k')
fplot(f3,[T10(1) T10(10)],'r')
load cpvsT.txt
plot(cpvsT(:,1),cpvsT(:,2),'m')
hold off


%Part E)
fprintf('Linear spline at 302.5K is %f.\n',f3(302.5))
fprintf('Interpolating Polynomial at 302.5K is %f.\n',f(302.5))
fprintf('Cubic Spline at 302.5K is %f.\n',f2(302.5))

fprintf('\nLinear spline at 343K is %f.\n',f3(343))
fprintf('Interpolating polynomial at 343K is %f.\n',f(343))
fprintf('Cubic spline at 343K is %f.\n',f2(343))

%Part F)
fprintf('\nActual estimate at 302.5K is %f.\n',(cpvsT(3,2)+cpvsT(4,2))/2)
fprintf('All three interpolation techniques are not accurate at 302.5K.\n')
fprintf('\nActual value at 343K is %f.\n',cpvsT(44,2))
fprintf('The splines are accurate at 343K, polynomials are not.\n') 

%Part 3
fprintf('\nPart 3:\n')

%Part A)
%Defining the vector freidnly anonymous function f
f = @(z, H) 200*(z./(5+z)).*exp(-2*z/H);

% integrate f from 0 to H, passing in H as the 2nd parameter to f
F = @(H) quad (f, 0, H, [], [], H);
%Plotting f to solve for 700
figure (4);
fplot (F, [1 30]);
title('F vs H')
xlabel('H')
ylabel('F')
grid on;
%Root finding function
rootF = @(H) F(H) - 700;
H = fzero (rootF, [15, 20]); % range from graph
fprintf ('Using quad, F is 700 at H = %f.\n', H);

% b)

% generate data points 
H = linspace(1,30,101);
F = zeros(size(H));
for i=1:length(H)
    F(i) = Ffunction(H(i)); 
end



% plot vectors
figure(5)
plot(H,F)
title('F vs H')
xlabel('H')
ylabel('F')
grid on;

ff = @(H) Ffunction(H)-700;
Hs = fzero(ff,[15 20]);
fprintf ('Using Simpson''s 1/3, F is 700 at H = %f.\n', Hs);

fn =@(z) 200 * (z / (5 + z)) * exp((-2 * z) / 5);
F = quad(fn, 0, 5);

a=0;
b=5;
bsaa=(b - a)/2;
ba=(b + a)/2;
c0=1;
c1=1;
x0=-0.57735;
x1=0.57735;

F1=bsaa*((c0*fn(ba+bsaa*x0)) + (c1 * fn(ba + bsaa * x1)));
fprintf('The value of F using 2 point Gaussian quadrature is %f.\n', F1);

c02=5/9;
c12=8/9;
c2=5/9;
x02=-0.77459;
x12=0;
x2=0.77459;

F2 = bsaa * ((c02 * fn(ba + bsaa * x02)) + (c12 * fn(ba + bsaa * x12)) + (c2 * fn(ba + bsaa * x2)));
fprintf('The value of F using 3 point Gaussian quadrature is %f.\n', F2);

c03=0.347855;
c13=0.652145;
c23=0.652145;
c3=0.347855;
x03=-0.861136;
x13=-0.339981;
x23=0.339981;
x3=0.861136;

F3 = bsaa * ((c03 * fn(ba + bsaa * x03)) + (c13 * fn(ba + bsaa * x13)) + ...
 (c23 * fn(ba + bsaa * x23)) + (c3 * fn(ba + bsaa * x3)));
fprintf('The value of F using 4 point Gaussian quadrature is %f.\n', F3);




end
function [F] = Ffunction(H)
%Ffunction Generates points using Simpson's 1/3 to compute F 
%Inputs:
%   H:value of H in below formula
%Outputs:
%   F:value of F ( calculated using Simpsons 1/3 rule )


f = @(z) 200 * (z ./ (5 + z)) .* exp(-2 * z / H);
z = linspace(0,H,101);
y = f(z);
F = Simpson13 (z(2)-z(1),y);


end
function [ I ] = Simpson13( h, y )
%SIMPSON13 Integrates using Simpson's 1/3 rule
%Inputs:
%H:size of interval
%   y: odd number of y values corresponding to evenly spaced x's
%Output:
%   I: integral calculated using Simpson's 1/3 rule

n = length(y);
sume = sum(y(2:2:n-1)); % sum of even indices 
sumo = sum(y(3:2:n-2)); % sum of odd indices (excluding 1 and n)

I = (h / 3) * (y(1) + 4*sume + 2*sumo + y(n));

end
