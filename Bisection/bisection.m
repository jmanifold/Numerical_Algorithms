function[rt,fx,ea,iter] = false_position(func,xl,xu,es,miter)
%false_position function
%Created on March 2rd 2019
%By: Jack Manifold
%The goal of this function is to determine the root of a 
%function via bisection

clearvars -except func xl xu es miter
%clears variables excpect for the ones needed for the code


%Inputs:
%func = name of function
%xl,xu = lower and upper guess
%es = desired relatibe error(defult = .0001%)
%miter = maximum allowable interation(defult = 200)
%Outputs:
%rt = real root
%fx = function value at root
%ea = approxiamte relative error (%)
%iter = number of iterations

format long
if nargin<3, error('at least 3 inputs are needed'),end 
    %three arguments are needed: the function and the upper and lower
%bounds, otherwise the code will terminate

tst = func(xl)*func(xu);

if tst>0, error('no detectable zero'),end
    %if tst returns >0 it is a postive number, meaning if there is a zero
%present between the bounds, the bisection method wont work

if nargin<4||isempty(es), es = 0.0001; end
    %if there are less than four arguments or the input es gets defulted to
%0.0001

if nargin<5||isempty(miter), miter = 200; end
    %if either are true, max iterations defults to 200

    %now the real fun begins
iter = 0; ea = 100; rt = xu;
while (ea > es && iter < miter)
    rtp = rt; %defining the original midpoint between the bounds
    rt = (xl+xu)/2;
    iter = iter + 1;
    tst = func(rt)* func(xu);
    if tst < 0
        xl = rt; 
            %changes the left bound to the midpoint for the next iteration
    elseif tst > 0
        xu = rt;
    else %only other outcome is tst = 0, in this case, the root has been 
    %found and ea is set to zero to end the loop
        ea = 0;
    end
    if func(rt) ~= 0
        ea = abs((rt-rtp)/rt)*100;
    end
end
root = rt;
fx = func(rt);
fprintf('the root is %i \nthe value at this point is %i \nthe approximated error of this root is %i \nit took %i iterations to reach this value\n',rt,fx,ea,iter)
end