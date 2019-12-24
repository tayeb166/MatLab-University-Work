%ECOR2606 Fall 2015
%Quiz 4
%Student Name: Tayeb Al-Shedayfat
%Student Number: 100957964

%Part 1
%defining vectors of values
x=[1.0 2.0 3.0 4.0 5.0 6.0 7.0 8.0 9.0];
y=[-36.45 -45.74 -56.01 -71.36 -81.08 -77.63 -55.04 -6.39 66.87];

%i)
p=polyfit(x,y,2);
fprintf('The coefficents of the cubic polynomial fit are: %f, %f and %f.\n',p)

%ii)
%defining anonymous function f
f=@(x) polyval(p,x);
%outputting the minimum
fprintf('The minimum of the fitted curve is at x = %f.\n',fminbnd(f,2,7))

%iii)
%producing a plot
figure(1)
plot(x,y,'xr')
hold on
fplot(f,[0 10])
grid on
title('Data 31')
ylabel('y')
xlabel('x')
hold off

%Part 2
%defining vectors
g=[5.0 10.0 15.0 20.0 25.0 30.0 35.0 40.0 45.0];
h=[5.547 7.307 7.772 8.313 8.668 8.861 9.041 8.998 9.153];

%i)
%taking log of both sides -> log10(h)= log10(Cg)-log10(D+g) =
%1og10(C)+log10(g) -1og10(D+g)
%i didnt know how to isolate for coeefcients so im just givingout random
%numbers

Z=zeros(length(g),2);
for i=1:length(g)
    Z(i,1)=(g(i));
    Z(i,2)=-log(g(i));
end

a1=Z\y';
C=a1(1);
D=a1(2);
fprintf('C=%f and D=%f.\n',a1);

%ii)
%defining the anoymous function 
height=@(g) C*(g/(D+g));
fprintf('if g is 12.5 then h=%f.\n',height(12.5))

%iii)
figure(2)
plot(g,h,'xr')
hold on
fplot(height,[0 50])
grid on
title('Data 32')
ylabel('h')
xlabel('g')
hold off






