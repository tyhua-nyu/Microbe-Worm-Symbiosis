function [qc,qh,qi]=Calqc(L,t,P,dT,Surf)
kappa=0.47;
rho=920;
dH=436500;
Teq=-1.606e-7.*10000.*P.^2+0.003672.*P.*100+265.2;
kd60=0.045;
Ea=90.95e3;
R=8.314;
A=1;
kd=Surf.*kd60.*exp(-Ea./R.*(1./Teq-1./281.4));
qh=sqrt(kappa.*dT.*rho.*dH./(2.*t));
qi=kd.*exp(-kd.*t).*A.*L.*rho.*dH;
qc=1./(1./qi+1./qh);
end
