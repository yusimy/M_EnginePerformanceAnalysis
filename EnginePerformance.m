T = [50 ,70,120, 150 ,153, 175 ,180, 180, 175, 165, 160, 150, 130];
N = [1000 ,1500, 2000, 2500 ,3000 ,3500, 4000, 4500, 5000 ,5500, 6000, 6500 ,7000];
Veff = [60,70, 80,85, 95, 96, 97, 95, 96, 94, 90, 85, 70];
af = [16,16.5,16,15,14.5,14.5,15,15,15,14,13,13,13];

fprintf('     Speed         AF\t      Bp\t      mdota\t\t      mdotf\t\t     bsfc\t\t     mtotal \n')

for i= 1:length(N)
        bp(i) = (2* pi* T(i)*(N(i)/60))/1000;
        ma(i) = ((Veff(i)/100)*1.181*(1.5*10^-3)*(N(i)/60))/2;
        mf(i) = ma(i)/af(i);
        bsfc(i) = (mf(i)*(3.6*10^6))/bp(i);
        mtotal(i) = (ma(i) + mf(i))*3600;
        
fprintf('%3.0f %drpm %10.1f %10.2fkW %10.4fkg/s %10.4fkg/s %10.2fg/kWh %10.2fkg/h \n',i,N(i),af(i),bp(i),ma(i),mf(i),bsfc(i),mtotal(i));

subplot(2,3,1)
plot(N(i),bp(i),'-x');
hold on;
title('Brake power vs Engine speed');
xlabel('engine speed (rpm)');
ylabel('brake power (kW)');

subplot(2,3,2)
plot(N(i),ma(i),'-x');
hold on;
title('Air flow rate vs Engine speed');
xlabel('engine speed (rpm)');
ylabel('air flow rate (kg/s)');

subplot(2,3,3)
plot(N(i),mf(i),'-x');
hold on;
title('Fuel flow rate vs Engine speed');
xlabel('engine speed (rpm)');
ylabel('fuel flow rate (kg/s)');

subplot(2,3,4)
plot(N(i),bsfc(i),'-x');
hold on;
title('Bsfc vs Engine speed');
xlabel('engine speed (rpm)');
ylabel('bsfc (g/kWh)');

subplot(2,3,5);
plot(N(i),mtotal(i),'-x');
hold on;
title('Exhaust flow rate vs Engine speed');
xlabel('engine speed (rpm)');
ylabel('exhaust flow rate (kg/h)');
end
hold off 



        
       
