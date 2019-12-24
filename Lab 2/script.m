%Part 2
%Tayeb Al-Shedayfat
%100957964

%A)
%assuming values for R1 and R2
R1 = 100;
R2 = 50;
%Script file that graphs overlap area on a range of D values [50,160]

%f is an anonymus function that calculates the value of overlap given a D.
f =@(D) overlap(R1,R2,D);

%using fplot to plot a graph for area values on D = [50 160]
figure (1);
fplot(f, [50 160],'m');
grid on;
title('Overlap Area vs. Distance Between Centers');
xlabel('Distance Between Centers (mm)');
ylabel('Overlap Area (mm^2)');

%using plot to make a graph of area value on D = [50 160]
%preparing the independant variables
x = linspace(50,160,100);
%loop to calculate and retun the area for each distance

for i = 1:length(x)
    y(i)=f(x(i));
end
%using plot function to plot the two vectors
figure (2);
plot(x,y);
grid on;
title('Overlap area vs. Distance Between Centers');
xlabel('Distance Between Centers (mm)');
ylabel('Overlap Area (mm^2)');

%B)
g =@(D) f(D)-2000;
D = fzero(g,[110 120]);

%C)

%let s be the temporary variable for producing the table
fprintf('Table 1: overlap area from D = 50mm to D = 160mm in steps of 10mm \n\n')

fprintf('  Distance       Area\n')
fprintf('  --------       ----\n')



s = 50:10:160;
for i = 1:length(s)
        z = zeros(size(s));
        z(i) = f(s(i));
        fprintf('%8.1f    %12.5f\n',s(i),z(i))
end

%testing for part 3

%using valid input to test function centerdist
fprintf('\n\nTesting for part 3\n')

fprintf('Valid inputs\n')
centredist(4,3,2)
centredist(4,3,eps)
centredist(4,3,(pi*3^2)-0.0001)

fprintf('Invalid inputs (negative value for area)\n')
%using invalid (negative) value for the area to get an error
%centredist(4,3,-1)

fprintf('Invalid inputs (negative for R1)\n')
%using invalid (negative) value for R1 to get an error
%centredist(-1,3,2)

fprintf('Invalid inputs (negative for R2)\n')
%using invalid (negative) value for R1 to get an error
centredist(3,-1,2)

fprintf('Invalid inputs (zero for R2)\n')
%using invalid (zero) value for R2 to get an error
centredist(4,0,-1)


  

