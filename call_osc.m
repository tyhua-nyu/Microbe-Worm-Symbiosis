tspan = [0:5:168];
y1_0 = 1.56;
y2_0 = 0.73;
y3_0 = 6.5;
y4_0 = 0;
y5_0= 0.0006;
[T,Y] = ode15s(@osc,tspan,[y1_0 y2_0 y3_0 y4_0 y5_0]);
figure(1)
plot(T,Y(:,1:3),'.');
title('50 bar');
legend('Methane','Oxygen','Substrate');
xlabel('Time [h]');
ylabel('Concentration [g/L]');
figure(2)
plot(T,Y(:,4),'.');
xlabel('Time [h]');
ylabel('Heat [kJ/L]');
