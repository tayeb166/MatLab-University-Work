function [] = lab4()
%LAB 4 as a no output/no input function
%ECOR 2606
%Name: Tayeb Al-Shedayfat
%Student number: 100957964


%PART 1
% Plot of plane 1 for first hour
t = linspace (0, 1); % for time from t = 0 to t = 1 hour 
[x1, y1] = plane1Position(t);%vector containing the coordinates of plane 1 along the first hour.
[x2, y2] = plane2Position(t);%vector containing the coordinates of plane 1 along the first hour.

%plotting the first plane position graph using plot
figure(1);
plot (x1, y1);
title('Position of Plane 1')
xlabel('x (km)')
ylabel('y(km)')
grid on

%plotting the second plane position graoh using plot
figure(2);
plot (x2, y2);
title('Position of Plane 2')
xlabel('x (km)')
ylabel('y(km)')
grid on


%plotting the distance between the two planes along 0 to 1 t
figure(3);
fplot(@distance, [0 1])
title('Distance between the two aircrafts according to time (fplot)')
xlabel('Time (hours)')
ylabel('Distance Apart(km)')
grid on

%plotting the distance between the two planes along 0 to 1 t using plot
figure(4);
D = distance(t);
plot(t,D,'m')
title('Distance between the two aircrafts according to time (plot)')
xlabel('Time (hours)')
ylabel('Distance Apart(km)')
grid on


%Defining the inverse of the function distance
G=@(t) -distance(t);
%Defining the fzero function
H=@(t) distance(t)-100;
%defining the minmum during the first hour
min = fminbnd(@distance,0,1);
%defining where max during t=20min = 1/3 and t=40min=2/3
max = fminbnd(G,1/3,2/3);

%outputting the desired data
fprintf('The aircraft will come closest at %f hours.\n',min)
fprintf('At this time they will be %f km apart.\n',distance(min))
fprintf('The arecraft will be furthest apart at %f minutes.\n',max*60)
fprintf('The aircraft will be %f km apart.\n',distance(max))
fprintf('The aircraft will be 100km apart at %f, %f, %f, %f hours.\n',fzero(H, [0 0.1]),fzero(H, [0.2 0.4]),fzero(H, [0.5 0.7]),fzero(H, [0.8 1]))

%defining a vector containg values from 0.4 to 0.5 with 0.01 steps
tt=0.4:0.01:0.5;
fprintf('Time   Distance\n')
fprintf('----   --------\n')
for i=1:length(tt)
    fprintf('%.2f %8.1f\n',tt(i),distance(tt(i)))
end

%testing invalid and valid inputs
%validtime = time(100)
%errortime = time(140)
%errordistance = time(distance(0.5))
%errordistance2 = time(distance(0.8))

%validcalcx1=calcX(110,0.45,20,8)
%validcalcx2=calcX(120,0.45,20,8)
%validcalcx3=calcX(120,0.45,19,8)
%invalidcalcx1= calcX(((0.45*9.81*20*cosd(15)+20*9.81*sind(15))/(0.01+8))*sqrt(0.01^2+8^2),0.45,20,8)
%invalidcalcx2= calcX(((0.45*9.81*20*cosd(15)+20*9.81*sind(15))/(10+8))*sqrt(10^2+8^2),0.45,20,8)

%subfunction plane1position
function [x, y] = plane1Position (t)
% PLANE1POSITION Calculates position of plane #1 at a given time
% Inputs:  
%      t = time (in hours)
% Outputs:  
%      x = x position (in km)
%      y = y position (in km)

x0 = 200; 
y0 = 100; 
speed = 400;
angle = 210 * (pi / 180);  % counterclockwise from x axis, in radians

x = x0 + cos(angle) * speed * t;
y = y0 + sin(angle) * speed * t;

end


%SubFunction Planceposition2
function [x, y] = plane2Position (t)
% PLANE2POSITION Calculates position of plane #2 at a given time
% Inputs:  
%      t = time (in hours)
% Outputs:  
%      x = x position (in km)
%      y = y position (in km)

radius = 100; 
speed = 450;
angle = (speed * t) / radius;

x = cos(angle) * radius;
y = sin(angle) * radius;

end

%SubFunction distance
function [ D ] = distance( t )
%distance calculates the distance between the two aircrafts at a particular
%t

%   Inputs:
    %t = time 
%   Outputs:
    %D = distance between the two aircrafts

%position vectors containing the postition of both planes at t
[x1 y1] = plane1Position(t);
[x2 y2] = plane2Position(t);

%return distance between the points using the d function
D = sqrt((x1-x2).^2+(y1-y2).^2);


end
%SubFunction time 
function [t] = time(D)
%time calculates and returns the distance at a give time
%   Inputs:
    %D = distance
%   Outputs:
    %t = time that corresponds to D
zero=@(t) distance(t)-D;
if D>=distance(0.5) || D<=distance(0.8)   
    error('Invalid inputs, distances between 0.5 and 0.8 hours are allowed.\n');
else
    fzero(zero,[0.5 0.8])
end

end

%subfunction calcx
function [ x ] = calcX( F,mu,m,h )
%calcX calculates and returns the value of x using root finding
%   Inputs:
    %F=Force in (N)
    %mu=friction coefficient
    %m=mass of the block
    %h=height of the pully above the ramp
%   Outputs:   
    %x=distance along the ramp

%defining the constatn g
g=9.81;
if(m<=0)
    error('Mass cannot be less than or equla to 0.\n');
else
    fun =@(x,F,mu,m,h) ((mu*m*g*cosd(15)+m*g*sind(15))/(x+h))*sqrt(x^2+h^2);
    zero =@(x) fun(x,F,mu,m,h) -F;
    x=fzero(zero,[0.01 10]);
    if x==0.01 || x==10
        error('Invalid inputs, you entered a value at the edge of interval.\n')
    else
        return
    end
end
    
end

end

