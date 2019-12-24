
function [  ] = P2(  )
%Funtion P2 is a no output no input function
%ECOR 2606 Fall 2015 - Quiz 3
%Name: Tayeb Al-Shedayfat
%Student number: 100957964
%defining matrix A and B and function to evaulate the matrix
B= [20;-8;3];
f=@(Y) [7 -2 (10+Y);9 (8+Y) -2;(10-Y) 5 6];

%part (i)
%if Y=0 calculating the x1,x2 and x3
solution = f(0)\B;
fprintf('For Y=0 => x1=%.2f, x2=%.2f and x3=%.2f\n',solution);

%(ii)
%Plotting of x3 vs Y from -5 to 10
figure(1)
fplot(@xthree,[-5 10]);
title('x3 vs Y')
ylabel('x3')
xlabel('Y')
grid on

%(iii)
minY = fminbnd(@xthree,-5,10);
minx3= xthree(minY);

%outputting results
fprintf('The value of Y that gives minimum x3 is equal to %.3f\nAnd the minimum x3 is %.3f\n',minY,minx3)




%Subfunction to calculate x3
function [ x3 ] = xthree( Y )
%Function xthree returns x3
%Inputs: Y = coefficent in matrix
%Outputs: x3 = the thrid root

sol= f(Y)\B;
x3=sol(3);

end

end

