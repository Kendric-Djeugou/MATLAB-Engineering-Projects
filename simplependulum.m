%Loading my Excel data
data = readtable('Simplependulum.xlsx');
L=data{:,1};
T_exp=data{:,2};
g=9.81;
%Formula for T theoritical
T_theoretical=2*pi*sqrt(L/g);
%plotting the graphs using subplot
figure
%graph 1 Experimental T vs L
subplot(2,2,1)
plot(L,T_exp,'g','DisplayName','Experimental');
%Labeling the graph
title('Experimental T(s) vs L(m)');
xlabel('Length (m)');
ylabel('Time period T (s)');
legend;
grid on;
hold on;
%graph 2 Theoritical T vs L
subplot(2,2,2)
plot(L,T_theoretical,'O-','DisplayName','Theoretical');
%Labeling the graph
xlabel('Length (m)');
ylabel('Time period T (s)');
title('Theoritical Time Period vs Length');
legend;
grid on;
y= log(T_exp);
x= log(L);
subplot(2,2,3)
%graph 3 lnT vs lnL
plot(x,y,'m','DisplayName','ln ');
%Labeling the graph
xlabel('ln(L)');
ylabel('ln(T)');
title(' ln(T) vs ln(L)');
legend;
grid on;
a=polyfit(x,y,1);
b=polyval(a,x);
subplot(2,2,4)
%graph 4 line of best fit
plot(x,b,'r--','DisplayName','best fit');
%Labeling the graph
xlabel('ln(L)');
ylabel('ln(T)');
title('Line of best fit for ln(T) vs ln(L)');
grid on;
legend;
%Calculating the mean value
mean_T=mean(T_exp)
%Calculating the medan value
median_T=median(T_exp)
%Calculating the standard deviation value
Standardeviation_T=std(T_exp)
%Normal distribution curve
figure
probplot('Normal',T_exp);
%Probability plot
figure
histfit(T_exp,20,'normal');