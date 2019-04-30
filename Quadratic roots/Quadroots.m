function[R1,R2] = Quadroots(A,B,C)
% Created on November 5th, 2018
% Modified on April 19th, 2019
% By: Jack Manifold
% Goal of the funciton is to discriminant roots to quadratic functions
% Inputs:
%       A = Coefficient in front of x^2
%       B = Coefficient in front of x
%       C = Coefficient without an x
% Output:
%       R1 = First root
%       R2 = Second root
% Determining the number of roots, D is the discriminate of the quadratic
% function inside the square root

D = B^2-4*A*C;

% Evaluating the roots

if D>0
   disp("Two Real Roots")
   R1 = ((-B-sqrt(D))/(2*A));
   R2 = ((-B+sqrt(D))/(2*A));
   fprintf('The roots are %g and %g\n',R1, R2)
elseif D == 0
    disp("One Real Roots")
    R1 = -B/(2*A);
    R2 = "NaN";
    fprintf('\nThe root is %g\n',R1)
else
    R1 = [];
    R2 = [];
    disp("No Real Roots")
end

end