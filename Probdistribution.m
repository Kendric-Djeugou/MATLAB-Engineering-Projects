% Experimental data (replace with actual values)
T_exp = [0.63, 1.41, 2.01, 2.47, 2.82];

% Fit a normal distribution to the data
pd = fitdist(T_exp', 'Normal');

% Generate a range of values for the curve
x = linspace(min(T_exp), max(T_exp), 100);
pdf_values = pdf(pd, x);

% Plot histogram of experimental data
figure;
histogram(T_exp, 'Normalization', 'pdf', 'FaceColor', 'blue', 'EdgeColor', 'black');
hold on;
plot(x, pdf_values, 'r-', 'LineWidth', 2); % Plot normal distribution curve
xlabel('Periodic Time (T) [s]');
ylabel('Probability Density');
title('Normal Distribution Fit');
legend('Histogram of Data', 'Fitted Normal PDF');
grid on;