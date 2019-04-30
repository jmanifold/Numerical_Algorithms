% Quadroots
% Created on November 5th
% By: Jack Manifold
% Goal of the funciton is to dertimine roots to quadratic functions
promt="What is the value of A\n";
promt2="What is the value of B";
promt3 = "What is the value of C";
A = input(promt);
B = input(promt2);
C = input(promt3);
D = B^2-4*A*C;
if D>0
   disp("Two Real Roots")
   R = ((-B-sqrt(D))/(2*A));
   R1 = ((-B+sqrt(D))/(2*A));
   fprintf('The roots are %g and %g\n',R, R1)
elseif D == 0
    disp("One Real Roots")
    R = -B/(2*A);
    fprintf('\nThe root is %g\n',R)
else
    disp("No Real Roots")
end