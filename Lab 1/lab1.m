%Tayeb Al-Shedayfat
%100957964


% PART 1

  %a)
    %Using calculator mode to calculate the value of the function at t=1
        (250./(1+56.75*exp(-0.17*1)))
  %b) 
    %Using calculator mode to calculate the value of the fucntion at t=4
        (250./(1+56.75*exp(-0.17*4)))
     
  %c)
    %Impleminting a function B(t) as an anynomys function
  
        B =  @(t)(250./(1+56.75*exp(-0.17*t)))

  %d)
    % Testing if the function would give the same answer as the caclulator
    % mode
        B(1)
  %e)
    % Testing if the function would give the same answer as the caclulator
    % mode
        B(4)
   %f)
    % Testing if the function would take t as a vector form
        B([1 4])

   %g)
    % Using fplot to create a graph (figure 1) with x and y labels and grid
    % on
   
        figure (1)
        fplot(B,[0 40])

        title ('Bacteria Population vs Time')
        xlabel('Time in Hours')
        ylabel('Bacteria Population in Thousands')
        grid on
        
    %h)
            
        %(250./(1+56.75*exp(-0.17*x)))-150 = 0
       
    %i)
     %writing the root finding equation to find when the functionn is going
     %to be equal to 150
    
       f = @(x)B(x)-150
                
                 
    %j)
     %using linspace to create equally spaced time values to estimate the
     %zero of the function and exporting that to figure 2 with titles and
     %grid 
    
       figure(2)
       x = linspace(0,40,50)
       y = f(x)
       plot(x,f(x))
       title ('Bacteria Population vs Time')
       xlabel('Time in Hours')
       ylabel('Bacteria Population in Thousands')
       grid on
      %fzero(f,[20 30])
        z = fzero(f,[25 30])
        fprintf('The number of bacteria is 150,000 when t=%f.\n',z)


%PART 2

    %Let e be the root equation given in the lab manual

      e = @(r) 1118.406985*r.^2 - 11.18407*r - 99.96272

    %Finding the roots using (fzero)
      x = linspace(-1,1,50)
      y = e(x)
      figure (3)
      plot(x,y)
      title ('Figure 3')
      xlabel('Radius')
      ylabel ('Y-axis')
      grid on
      r3 = fzero(e,[0.25 1])
      fprintf('using fzero the diameter is %f.\n',2*r3)
    
    
    %Finding the roots using (roots)
    
      r = roots([1118.406985 -11.18407 -99.96272])
      fprintf('using roots the diameter is %f.\n',2*r(1))
        
    
% Part 3

    %Vo= volume of the outer sphere (brass + interior)
    %Vi= volume of the interiour sphere (R)
    %Vb = volume of the brass
    %D= density of the brass
    %m= mass of the brass
    
    
    %We have: D=m/v --> D*v=m --> 
                         % 8900*Vb=100                              eq(1)
    
    %Now we can use the fasct that the volume of the brass (Vb) is (V0-Vi) so
    %the equation (1) becomes: 
                        
                       % 8900*(V0-Vi)=100                           eq(2)
    
    %And we know that the volume of a sphere is V = 4pi/3*R^3 where R is the
    %radius
    
    % now we can use the definiton of the volume in eq(2):
    
                % 8900 * (4pi/3*(0.01+R)^3-4pi/3*(R)^3) = 100       eq(3)
      
    % 35600pi/3 * ((0.01+R)^3-R^3) = 100
    
    % 35600pi/3 * (R^3 + 0.03R^2 + 0.0003R + 0.000001 - R^3) = 100
    
    % 356piR^2 + 89pi/25R + (35600pi/3)*1e(-6) - 100 = 0
    
    % Splyfiying that eq will Yield:
    
        % 1118.406985R2 - 11.18407R - 99.96272 = 0 
        % Which is equal to the eq given in the lab manual 
    
