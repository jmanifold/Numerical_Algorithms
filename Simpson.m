function[I] = Simpson(x,y)

%Goal of the function is to approximate the integral of a given function
%on a given range using Simpson's 1/3 method
%Created by: Jack Manifold
%Created on: April 15, 2019

%Inputs:
    %x: The recorded x positions given in array form
    %y: The functional values relative to the x position in array form
%Outputs:
    %I: The value of the approximated integral
   
    clearvars -except x y
    clc
    
if nargin~=2
    error('Two arrays of equal length must be inputted')
end

   if length(x)~=length(y)
    error('Inputs must be the same lengths')
end

if isrow(x)==1 
    x = transpose(x);
end
if isrow(y)==1
    y = transpose(y);
end
    L = length(x);
    tst = linspace(min(x),max(x),L);
    tst = transpose(tst);
    que = tst==x;
    if sum(que)~=L
        error('The x values must be equally spaced')
    end
    if mod(L,2)==0
        choice = menu('The trapazoidal method must be used for the intergration, continue?','Yes','No');
        if choice == 2
            return
        end
    %code with trapazoid
       
        b = (x(L-1,1)-x(1,1));
            for i = 2:2:L-1
                mid(:,i-1) = 4*(y(i,1));
            end
            for j = 3:2:L-2
                mid2(:,j-1) = 2*(y(j,1));
            end
            mid = sum(mid);
            mid2 = sum(mid2);
            I = b*((y(1,1)+mid+mid2+y(L-1,1))/(3*(L-2)));
            
            trap = (x(L,1)-x(L-1,1))*((y(L,1)+y(L-1,1))/2);
        I = I+trap;
    
    else
        %code without trapazoid
            b = (x(L,1)-x(1,1));
            for i = 2:2:L
                mid(:,i-1) = 4*(y(i,1));
            end
            for j = 3:2:L-2
                mid2(:,j-1) = 2*(y(j,1));
            end
            mid = sum(mid);
            mid2 = sum(mid2);
            I = b*((y(1,1)+mid+mid2+y(L,1))/(3*(L-1)));
    end 
end