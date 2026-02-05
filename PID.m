clc, clear all, close all;

% Root Locus
s=tf('s');
G1=(s+8)/((s+3)*(s+6)*(s+10));
figure(1)
rlocus(G1)

%%
%PD Controller
C_PD = 5.34*(s+55.92);
G2=series(C_PD,G1);
figure(2)
rlocus(G2)

%%
%PID Controller
C_PID = 4.6*(s+55.92)*(s+0.5)/s;
G3=series(C_PID,G1);
figure(3)
rlocus(G3)
%%

% closed loop simulation
T1=feedback(121.5*G1,1,-1);
T2=feedback(G2,1,-1);
T3=feedback(G3,1,-1);
%% Plotting
figure(4)
step(T1,[0,2])
hold on
step(T2,[0,2])
step(T3,[0,2])
legend('P', 'PD', 'PID')
hold off