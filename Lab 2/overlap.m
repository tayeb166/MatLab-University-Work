function [ area ] = overlap( R1,R2,D )
%Overlap caclulates the overlapped area between two circles
%Usage: 
    %[area] = overlap(R1,R2,D)
%Inputs: 
    %R1 = radii of the first circle
    %R2 = radii of second circle
    %D = distance between the centers of the two circles
%Outputs:
    % area = area of overlapping
    
%Student name: Tayeb Al-Shedayfat
%Student number: 100957964

%Case 1: If Statement that tests for invalid inputs and retuns error if so
if D<0 || R1<=0 || R2<=0
    
    error('Invalids inputs. R1 and R2 must be greater than zero and D must not be negative')
    
end

%Case 2: If statement to output error in case there is no overlap
if D >= R1+R2
    area = 0;
    return
end

%Case 3: If statement to return the value of overlap if one of the circles
%is inside the other one
if D <= abs(R1-R2)
    r = min(R1,R2);
    area = pi*r.^2;
    return
end

%Case 4: The infputs are valid and the circles partially overlap

%using a formula to solve the question
%cutting the area into two segemnts and calculating the area of each segment
x1 = (D^2 + R1^2 - R2^2)/(2*D);
x2 = D-x1;

% A is an anonymous function that calculates the area of each segment
A = @(x,R) ((pi*R^2)/2) - (x*sqrt(R^2 - x^2) + R^2*asin(x/R));

area = A(x1,R1)+A(x2,R2);

end


