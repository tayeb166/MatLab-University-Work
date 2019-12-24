function [  ] = lab6(  )
%LAB 6 - ECOR2606
%Name: Taybe Al-Shedayfat
%#:100957964

%Part 1
%(i)
A = [ 2 -14 5; 5 6 -2; 1 5 3]; b = [52; 2; 17];
%1st Way to find solution using inv(A)
x1=inv(A)*b;
fprintf('Using inv(A), the solution is a = %.1f, b = %.1f, c = %.1f.\n',x1)
fprintf('Using inv(A), the value of b is %.1f.\n',x1(2))
%2nd Way to find solution using A^-1
x2 = A^-1 * b; 
fprintf('Using A^-1, the solution is a = %.1f, b = %.1f, c = %.1f.\n',x2)
fprintf('Using A^-1, the value of b is %.1f.\n',x2(2))

%3rd Way to find solution using left division
x3 = A\b;
fprintf('Using left division, the solution is a = %.1f, b = %.1f, c = %.1f.\n',x3)
fprintf('Using left division, the value of b is %.1f.\n',x3(2))

%{
(ii)
     2   -14     5    52
     5     6    -2     2
     1     5     3    17
swap rows 1 and 2:
     5     6    -2     2
     2   -14     5    52
     1     5     3    17
Multiply row 1 by -2/5 and add to row 2 to get new row 2:
    5    6    -2    2
    0  -16.4  5.8   51.2
    1    5     3    17
Multiply row 1 by -1/5 and add to row 3:
    5    6      -2    2
    0  -16.4    5.8   51.2
    0    3.8    3.4   16.6
No pivoting needed; multiply row 2 by 3.8/16.4 and add to row 3:
    5      6         -2       2
    0    -16.4       5.8   51.2
    0      0       4.7439   28.4634

Back substitution:
c =  28.4634/4.7439 = 6
b =  (51.2 - 5.8*6)/(-16.4) = -1
a =  (2 + 2*6 - 6*(-1))/5 = 4
%}

% part 2
% (i) subfunction at the bottom

% (ii)

fprintf('The solution when Y=0 is x1 = %f, x2 = %f, x3 = %f.\n',findAllX(0))

%(iii)
%See subfunction below

%(iv)
%graph using fplot
figure(1)
fplot(@findX1,[0 12]) 
title('x1 vs Y (using fplot)')
xlabel('Y')
ylabel('x1')
grid on

% (v) 
%graph using plot and loop
figure(2)
yv = linspace(0,12); 
x1v = zeros(size(yv)); % pre-allocating
for i=1:length(yv)
    x1v(i) = findX1(yv(i));
end
plot(yv,x1v)
title('x1 vs Y (usign plot)')
xlabel('Y')
ylabel('x1')
grid on

% (vi) 
%finding Y that minimizes x1 over this interval and the minimum x1 and
%outputting the results using fprintf
minY = fminbnd(@findX1,0,12);
minX1 = findX1(minY);
fprintf('The minimum x1 = %f and it occurs at Y = %f.\n',minX1,minY)

%Part 3
%(i)

%Assume m = mass of ship; c = mass of cargo; Cl = mass of offliaded in
%Cleveland

%We know that in Edmund we have 26,000 tons more than empty
%c = m + 26000 which gives us m - c + 0Cl = -26000
%Offloading 14000 of ore at Sault Ste. Marie, Onatrio
%m + c + 0Cl = (11200+14000) --> m + c + 0Cl = 126000
%Proceeding to Cleveland then Ohio to offload and then lose half mass of
%original mass
%(m+c)/2=(m + c - 14000 - Cl) --> 0.5m+0.5c - Cl = 14000

% Then our matrix is:
% A = 1 -1 0
%     1  1 0
%     1  1 -2

% And b = (-26000;126000;28000)

%Solivng the system using left diviosion
A= [1 -1 0; 1 1 0; 1 1 -2];
b= [-26000; 126000; 28000];
x=A\b;
%Using fprintf to output the results
fprintf('The ship weighs %.1f tons when empty.\n',x(1))
fprintf('The mass of the original cargo was %.1f tons.\n',x(2))
fprintf('The mass of the cargo offloaded in Cleveland was %.1f tons.\n',x(3))

%Sunfunction findAllx
function [ x ] = findAllX( Y )
%findAllX Finds the solution to the equations for a given Y
    %Input:
    %Y = value of Y to substitute into equations
    %Output:
    %x = vector solution to the equations

A = [5-Y -4 4; -5 4+Y 3; 5 3 1+Y];
b = [1; 4; -2];

x = A\b; 

end

%Subfunction findX1
function [ x1 ] = findX1( Y )
%findX1 Finds x1  in findAllX with the given Y
%   Input:
      %Y = value of Y to substitute into equations
%   Output:
     %x1 = 1st element of 3 element vector solution to the system of equations
x = findAllX(Y);
x1 = x(1);
end

end

