SL=1e-50;
SH=10;
ST=10;
d=0.1;
targetm=0.016*d*1000;
i=1;
j=1;
P=80;%pressure unit: bar
z=(P/10-0.1013)/0.010104;
Surf=2;%surfactant constant
cT=zeros(6,360);
ll=logspace(-4,1,100);
tt=[1:1:360];
for(l=ll)
    for(t=1:1:360)
        SL=1e-50;
        SH=10;
        ST=10;
        i=1;
        while (abs(Calqc(l,t,P,ST,Surf)-targetm)>0.00001 & i<500)
            ST = 0.5.*(SH+SL);
            if  Calqc(l,t,P,ST,Surf)-targetm > 0
             SH = ST;
                i=i+1;
            else
                SL = ST;
                i=i+1;
            end
        end     
        cT(j,t)=ST;
    end
    j=j+1;
end
mesh(tt,ll,cT)
set(gca, 'ZScale', 'log')
set(gca, 'YScale', 'log')
zlim([0,1]);
ylim([1e-4,10]);
view([-135,45]);
xlabel('Time [s]');
ylabel('Thickness [m]');
zlabel('Critical Temperature [K]');
title(['Pressure ' num2str(P) ' bar (' num2str(z,'%.0f') ' m)']);
hold on