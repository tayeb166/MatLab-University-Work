function [ D ] = centredist(R1,R2,area)
%Centerdist calculates the distance corresponding to the area between two
%circle with radius R1 and R2
%Usage:
    %[D] = centerdist(R1,R2,area)
%Inputs: 
    %R1 = radii of the first circle
    %R2 = radii of second circle
    %area = area of overlap between the two circles
%Outputs:
    % D = distance between the centers of the cicrcles
    
%Student name: Tayeb Al-Shedayfat
%Student number: 100957964

if R1 <=0 || R2 <= 0 || area <= 0 || area  >= (pi*(min(R1,R2)^2))
    error('Invalid inputs. R1 and R2 must and circles must partially overlap\n')
end

a =@(D) overlap(R1,R2,D) - area;

D = fzero(a, [abs(R1-R2),(R1+R2)]);


   
end



