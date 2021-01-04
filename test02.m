z=[1:1:5000];
Tbw=4+(34-4.0)*exp(-0.0037*z);
w=1000*(0.117./(1+(z./200).^3)+0.006./(1+(z./4000).^10));
P=0.010104*z+0.1013;
P0=0.1013;
Tm=(1./0.141).*log((P-1.3)./1.66);
Lghsz=(Tm-Tbw)/0.042;
figure(1)
hold on
distM=zeros(1,5000);
for(poc=[-1.14:0.01:0.66])
    GHI=0.002848.*(Lghsz).^1.681.*(10.^poc-24.42./(w.^0.9944)).*exp(-(-1.441+0.3925.*log(w)).^2);
%     GHI=0.003338.*(Lghsz).^1.708.*(10.^poc-31.62./(w.^1.0944)).*exp(-(-1.631+0.4245.*log(w)).^2);
%     GHI=0.002358.*(Lghsz).^1.654.*(10.^poc-17.22./(w.^0.8944)).*exp(-(-1.251+0.3605.*log(w)).^2);
% plot(z(Lghsz>0&GHI>0),GHI(Lghsz>0&GHI>0));
        distM(Lghsz>0&GHI>0)=distM(Lghsz>0&GHI>0)+normpdf(poc,-0.24,0.45)*GHI(Lghsz>0&GHI>0);
end
plot(z,distM./(sum(distM)))
500.*sum(distM(100:600))./sum(distM)
