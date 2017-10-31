function [a, b] = linfit(x,y)
% Linfit - calculates the optimal line between training set
%   takes in training sets X and Y and outputs the optimal a and b
%   that make up the line: y = ax + b

N = length(x);

% Throws error if the x and y dimentions won't match
if N ~= length(y)
    error('x and y different size');
else
    % Calculate the sum for x_i * y_i
    % and x_i^2
    sum_xy = 0;
    sum_xx = 0;
    
    for i = 1:N
        sum_xy = sum_xy + x(i)*y(i);
        sum_xx = sum_xx + x(i)*x(i);
    end
    
    % formula from: (d/da)*1/N* Sum[from i=1 to N](ax_i + b - y_i)^2 = 0
    %               (d/db)*1/N* Sum[from i=1 to N](ax_i + b - y_i)^2 = 0
    a = (N * (sum_xy) - sum(x)*sum(y) )/ (N * sum_xx - sum(x)*sum(x));
    b = (sum(y) - a*sum(x))/N;
end

end

