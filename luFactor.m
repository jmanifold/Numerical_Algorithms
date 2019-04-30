function[L,U,P] = luFactor(A)
%The goal of this function is to perform LU factorization given a
%square coefficient matrix
%Created: March 27, 2019
%By: Jack Manifold

%Inputs:
%   A = Coefficient Matrix
%Outputs:
%   L = Lower Triangular Matrix
%   U = Upper Triangular Matrix
%   P = Pivot Matrix

format shortg

clearvars -except A
clc

if nargin ~= 1, error('Must have only one coefficeint matrix inputted')
end

[n,m] = size(A);
if n~=m, error('Matrix must be square')
end

%setting up 
P = eye(n); U = A; L = P;

for i = 1:n-1
    %Finding the value to Pivot around
    mx = max(abs(U(i:n,i)));
    S = U(:,i)==mx;
    dx = find(S==1);
    if isempty(dx)
        S = U(:,i)==-mx;
        dx = find(S==1);
    end
    dx = dx(1,1);
        if U(dx,i) ~= U(i,i)
            temp = U(dx,i:n);
            U(dx,i:n) = U(i,i:n);
            U(i,i:n) = temp;
            
                %Pivoting the Pivot Matrix
            temp = P(dx,:);
            P(dx,:) = P(i,:);
            P(i,:) = temp;
            if i>=2
                    %Pivoting the L Matirx
                temp = L(dx,1:i-1);
                L(dx,1:i-1) = L(i,1:i-1);
                L(i,1:i-1) = temp;
            end
        end
    %Guassian Elimination
    for j = i+1:n
        L(j,i) = U(j,i)/U(i,i);
        U(j,i:n) = U(j,i:n)-U(i,i:n)*L(j,i);
    end
end
end