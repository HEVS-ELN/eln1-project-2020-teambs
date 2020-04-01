path = 'C:\Users\Mariéthoz Cédric\Desktop\HES2\ELN\projet\eln1-project-2020-teambs-master\data\ConductiveProbe\';
freq = [];
V1=[];
V2=[];
k=0;
file = [path ('R10k_0.csv')];
data = readmatrix(file, 'Range', 2);

freq(:,k+1) = data(:,1);
V2(:,k+1) = 10.^(data(:,3)/20).*exp(1j*data(:,4)*pi/180);
Amp2(:,k+1) = 10.^(data(:,3)/20);
Phase2(:,k+1) = data(:,4)*pi/180;

k=1;
file = [path ('R10k_1.csv')];
data = readmatrix(file, 'Range', 2);

freq(:,k+1) = data(:,1);
V2(:,k+1) = 10.^(data(:,3)/20).*exp(1j*data(:,4)*pi/180);
Amp2(:,k+1) = 10.^(data(:,3)/20);
Phase2(:,k+1) = data(:,4)*pi/180;

k=2;
file = [path ('R10k_2.csv')];
data = readmatrix(file, 'Range', 2);

freq(:,k+1) = data(:,1);
V2(:,k+1) = 10.^(data(:,3)/20).*exp(1j*data(:,4)*pi/180);
Amp2(:,k+1) = 10.^(data(:,3)/20);
Phase2(:,k+1) = data(:,4)*pi/180;

k=3;
file = [path ('R10k_3.csv')];
data = readmatrix(file, 'Range', 2);

freq(:,k+1) = data(:,1);
V2(:,k+1) = 10.^(data(:,3)/20).*exp(1j*data(:,4)*pi/180);
Amp2(:,k+1) = 10.^(data(:,3)/20);
Phase2(:,k+1) = data(:,4)*pi/180;

k=4;
file = [path ('R10k_4.csv')];
data = readmatrix(file, 'Range', 2);

freq(:,k+1) = data(:,1);
V2(:,k+1) = 10.^(data(:,3)/20).*exp(1j*data(:,4)*pi/180);
Amp2(:,k+1) = 10.^(data(:,3)/20);
Phase2(:,k+1) = data(:,4)*pi/180;


R1 =10000;
for i = 1:1001    
Rp(i,1) = (R1 * Amp2(i,1) * (1+tan(Phase2(i,1))^2)^0.5)/(1-Amp2(i,1)*(1+tan(Phase2(i,1))^2)^0.5);
Rp(i,2) = (R1 * Amp2(i,2) * (1+tan(Phase2(i,2))^2)^0.5)/(1-Amp2(i,2)*(1+tan(Phase2(i,2))^2)^0.5);
Rp(i,3) = (R1 * Amp2(i,3) * (1+tan(Phase2(i,3))^2)^0.5)/(1-Amp2(i,3)*(1+tan(Phase2(i,3))^2)^0.5);
Rp(i,4) = (R1 * Amp2(i,4) * (1+tan(Phase2(i,4))^2)^0.5)/(1-Amp2(i,4)*(1+tan(Phase2(i,4))^2)^0.5);
Rp(i,5) = (R1 * Amp2(i,5) * (1+tan(Phase2(i,5))^2)^0.5)/(1-Amp2(i,5)*(1+tan(Phase2(i,5))^2)^0.5);
Cp(i,1) = -tan(Phase2(i,1))*(R1 + Rp(i,1))/(R1*Rp(i,1)*2*pi()*freq(i,1));
Cp(i,2) = -tan(Phase2(i,2))*(R1 + Rp(i,2))/(R1*Rp(i,2)*2*pi()*freq(i,2));
Cp(i,3) = -tan(Phase2(i,3))*(R1 + Rp(i,3))/(R1*Rp(i,3)*2*pi()*freq(i,3));
Cp(i,4) = -tan(Phase2(i,4))*(R1 + Rp(i,4))/(R1*Rp(i,4)*2*pi()*freq(i,4));
Cp(i,5) = -tan(Phase2(i,5))*(R1 + Rp(i,5))/(R1*Rp(i,5)*2*pi()*freq(i,5));
end


tiledlayout(2,1)

% Top plot
ax1 = nexttile;
loglog(ax1,freq(:,1),Rp(:,1),'r',freq(:,2),Rp(:,2),'g',freq(:,3),Rp(:,3),'b',freq(:,4),Rp(:,4),'c',freq(:,5),Rp(:,5),'m')
title(ax1,'Top Plot')
ylabel(ax1,'Rp')

% Bottom plot
ax2 = nexttile;
loglog(ax2,freq(:,1),Cp(:,1),'r',freq(:,2),Cp(:,2),'g',freq(:,3),Cp(:,3),'b',freq(:,4),Cp(:,4),'c',freq(:,5),Cp(:,5),'m')
title(ax2,'Bottom Plot')
ylabel(ax2,'Cp')

