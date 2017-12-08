%% Asks points from the user.

% stops when the user presses "return"
figure; axis([0 5 0 5]); [X,Y] = ginput;

% Plots the points
scatter(X,Y); hold;

%% Fit the optimal line to the points

[a, b] = linfit(X,Y);

%% Plots the line  
% Uses the refline from Statisticand Machine learning toolbox.
% Makes the line look better since it fits to the current axis.

line = refline(a,b);
set(line, 'Color', 'red');

% Could also plot the line using standard toolkit:
% x = linspace(0, 5);
% y = a*x + b;
% plot(x,y)