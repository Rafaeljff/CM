

%largura de banda de frequência entre canais 
Safeguard_band=20e3;

%utilização de 7 agregados por célula portanto 925 Mhz-960 Mhz está reservado
%para 7 divisões de canal pela célula logo: fqmax-fqmin = 960Mhz-935Mhz = 25 Mhz 
% 25 Mhz dedicados para cada canal. Mas cada canal está abrangido por uma distância entre
%frequências  de 20Khz, pelo que cada canal tem um largura de
%banda F= (25MhZ / 7) -(20e3)=3.55Mhz

%Subdibidiu se cada celula entre a gama de frequencias do GSM para um  maior aproveitamento  possível do espetro de frequências do GSM900
%uma vez que assim permite uma maior capacidade de trafego, pois existem
%mais canais disponiveis e possivel mais utilizadores em simultâneo

fqmax = 960e6; % 960 mhz máximo freq de uplink
Fdiv=25e6/7;
Safeguard_band=20e3;
 fqmin=935e6;
%arquitetura	hexagonal	utiliza	7	grupos	de	frequências
 %Cada	divisão	de	frequências	é	consignado	a uma célula	particular

%As frequencias de cada célula são apenas desfazadas por uma banda de
%guarda de f=20khz pelo que se num agregado de células entre cujo a gama de
%frequência seja próxima da outra célula adjacente pode existir umA maior
%interferncia entre sinal ruido (SNR), pelo que é desejavel que nas células
%adjacentes a uma outra esta gama de frequências tenham a maior distância
%possivel em freqûencia
%para células adjacentes .
%Pelo que para cobrir a àrea suposta sendo esta a Marinha Grande, será
%necessário um agregado de 7 estacoes base, de modo a que cubra
%determinados meios de comunicação

fq1=fqmin+Fdiv;
fq2=fq1+Fdiv+Safeguard_band;
fq3=fq2+Fdiv+Safeguard_band;
fq4=fq3+Fdiv+Safeguard_band;
fq5=fq4+Fdiv+Safeguard_band;
fq6=fq5+Fdiv+Safeguard_band;
fq7=fq6+Fdiv;
%Serão necessarias antenas diretivas uma vez que se pretende estabelecer
%um agregado de antenas ao redor da zona de estudo e fazer com que estas
%sejam direcionadas para o centro da região, para isso tem de ter uma
%direção de radiação desfazada por volta de 60º entre elas para o centro.
%anguladas em relacao ao centro 360/6=60 graus

ant1=design(reflector, fq1);
ant1.Tilt = [90 90 180]; % roda 90%
ant1.TiltAxis = [1 0 0;0 1 0; 0 0 1]; % eixo dos xx yy zz ( mexer nos eixo ZZ para mudar a direção)

ant2 = design(reflector, fq2);
ant2.Tilt = [90 90 60]; % roda 90%
ant2.TiltAxis = [1 0 0;0 1 0; 0 0 1]; % eixo dos xx yy zz ( mexer nos eixo ZZ para mudar a direção)


ant3 = design(reflector,fq3);
ant3.Tilt = [90 90 120]; % roda 90%
ant3.TiltAxis = [1 0 0;0 1 0; 0 0 1]; % eixo dos xx yy zz ( mexer nos eixo ZZ para mudar a direção)

ant4 = design(reflector,fq4);
ant4.Tilt = [90 90 300]; % roda 90%
ant4.TiltAxis = [1 0 0;0 1 0; 0 0 1];

ant5 = design(reflector,fq5);
ant5.Tilt = [90 90 240]; % roda 90%
ant5.TiltAxis = [1 0 0;0 1 0; 0 0 1];

ant6 = design(reflector,fq6);
ant6.Tilt = [90 90 180]; % roda 90%
ant6.TiltAxis = [1 0 0;0 1 0; 0 0 1];

ant7 = design(monopoleRadial,fq7);




%39.74725490767334, -8.809335058401215 castelo
% tx = txsite("Name","MathWorks", ...
%     "Latitude",39.74725490767334, ...
%     "Longitude",-8.809335058401215, ...
%     "Antenna",[ant1,ant2,ant3], ...  %cada antena tem 
%     "AntennaHeight",20, ...        % Units: meters
%     "TransmitterFrequency",[fq1,fq2,fq3], ... % Units: Hz
%     "TransmitterPower",8);        % Units: Watts


%As frequencias de cada estação base serão reutilizadas na próxima estação logo
%é essencial fazer um bom planeamento para não haver interferencia entre
%celulas com frequencias identicas para diferentes estações base que
%estejam adjacentes.

% tx = txsite("NAME","MathWorks", ...
%     "Latitude",39.74725490767334, ...
%     "Longitude",-8.809335058401215, ...
%     "Antenna",[ant1,ant2,ant3,ant4,ant5,ant6,ant7],...  %cada antena tem 
%     "AntennaHeight",20, ...        % Units: meters
%     "TransmitterFrequency",[fq1,fq2,fq3,fq4,fq5,fq6,fq7],... % Units: Hz
%     "TransmitterPower",300);        % Units: Watts
tx1 = txsite("NAME","eb1", ...
    "Latitude",39.756624, ...
    "Longitude",-8.925917, ...
    "Antenna",[ant1],...  %cada antena tem 
    "AntennaHeight",20, ...        % Units: meters
    "TransmitterFrequency",[fq1],... % Units: Hz
    "TransmitterPower",5);  
show(tx1)
tx2 = txsite("NAME","eb2", ...
    "Latitude",39.741866, ...
    "Longitude",-8.947965, ...
    "Antenna",[ant2],...  %cada antena tem 
    "AntennaHeight",20, ...        % Units: meters
    "TransmitterFrequency",[fq2],... % Units: Hz
    "TransmitterPower",5);      
show(tx2)
tx3 = txsite("NAME","eb3", ...
    "Latitude",39.723532, ...
    "Longitude",-8.948699, ...
    "Antenna",[ant3],...  %cada antena tem 
    "AntennaHeight",20, ...        % Units: meters
    "TransmitterFrequency",[fq3],... % Units: Hz
    "TransmitterPower",5);      
show(tx3)

tx4 = txsite("NAME","eb4", ...
    "Latitude",39.74725490767334, ...
    "Longitude",-8.904104, ...
    "Antenna",[ant4],...  %cada antena tem 
    "AntennaHeight",20, ...        % Units: meters
    "TransmitterFrequency",[fq4,],... % Units: Hz
    "TransmitterPower",5); 
show(tx4)
tx5 = txsite("NAME","eb5", ...
    "Latitude",39.726750, ...
    "Longitude",-8.910540, ...
    "Antenna",[ant5],...  %cada antena tem 
    "AntennaHeight",20, ...        % Units: meters
    "TransmitterFrequency",[fq5],... % Units: Hz
    "TransmitterPower",5);    
show(tx5)
tx6 = txsite("NAME","eb6", ...
    "Latitude",39.718087, ...
    "Longitude",-8.928441, ...
    "Antenna",[ant6],...  %cada antena tem 
    "AntennaHeight",20, ...        % Units: meters
    "TransmitterFrequency",[fq6],... % Units: Hz
    "TransmitterPower",5);    
show(tx6)
tx7 = txsite("NAME","eb7", ...
    "Latitude",39.736382, ...
    "Longitude",-8.925263, ...
    "Antenna",[ant7],...  %cada antena tem 
    "AntennaHeight",20, ...        % Units: meters
    "TransmitterFrequency",[fq7],... % Units: Hz
    "TransmitterPower",5);      
show(tx7)
% 39.829115,-8.991296
% 39.757564,-9.030706
% 39.715587,-8.994394
% 39.820198,-8.913399
% 39.773579,-8.883238
% 39.714373,-8.932457
% 39.756398,-8.940343
% tx1 = txsite("NAME","MathWorks", ...
%     "Latitude",39.829115, ...
%     "Longitude",-8.991296, ...
%     "Antenna",[ant1],...  %cada antena tem 
%     "AntennaHeight",20, ...        % Units: meters
%     "TransmitterFrequency",[fq1],... % Units: Hz
%     "TransmitterPower",40);  
% show(tx1)
% tx2 = txsite("NAME","MathWorks", ...
%     "Latitude",39.757564, ...
%     "Longitude",-9.030706, ...
%     "Antenna",[ant2],...  %cada antena tem 
%     "AntennaHeight",20, ...        % Units: meters
%     "TransmitterFrequency",[fq2],... % Units: Hz
%     "TransmitterPower",40);      
% show(tx2)
% tx3 = txsite("NAME","MathWorks", ...
%     "Latitude",39.715587, ...
%     "Longitude",-8.994394, ...
%     "Antenna",[ant3],...  %cada antena tem 
%     "AntennaHeight",20, ...        % Units: meters
%     "TransmitterFrequency",[fq3],... % Units: Hz
%     "TransmitterPower",40);      
% show(tx3)
% 
% tx4 = txsite("NAME","MathWorks", ...
%     "Latitude",39.820198, ...
%     "Longitude",-8.913399, ...
%     "Antenna",[ant4],...  %cada antena tem 
%     "AntennaHeight",20, ...        % Units: meters
%     "TransmitterFrequency",[fq4,],... % Units: Hz
%     "TransmitterPower",40); 
% show(tx4)
% tx5 = txsite("NAME","MathWorks", ...
%     "Latitude",39.773579, ...
%     "Longitude",-8.883238, ...
%     "Antenna",[ant5],...  %cada antena tem 
%     "AntennaHeight",20, ...        % Units: meters
%     "TransmitterFrequency",[fq5],... % Units: Hz
%     "TransmitterPower",40);    
% show(tx5)
% tx6 = txsite("NAME","MathWorks", ...
%     "Latitude",39.714373, ...
%     "Longitude",-8.932457, ...
%     "Antenna",[ant6],...  %cada antena tem 
%     "AntennaHeight",20, ...        % Units: meters
%     "TransmitterFrequency",[fq6],... % Units: Hz
%     "TransmitterPower",40);    
% show(tx6)
% tx7 = txsite("NAME","MathWorks", ...
%     "Latitude",39.756398, ...
%     "Longitude",-8.940343, ...
%     "Antenna",[ant7],...  %cada antena tem 
%     "AntennaHeight",20, ...        % Units: meters
%     "TransmitterFrequency",[fq7],... % Units: Hz
%     "TransmitterPower",40);      
% show(tx7)
min=-100;
max_signal=-5;
sigStrengths = min:max_signal;


% type_coverage="freespace";
 type_coverage="longley-rice";
% % type_coverage="raytracing";
% %o máximo de alcance numa estação base pode ser até 30 km.
coverage([tx1,tx2,tx3,tx4,tx5,tx6,tx7],type_coverage,"SignalStrengths",sigStrengths,'MaxRange',2000,Resolution="auto");
% coverage(tx2,type_coverage,"SignalStrengths",sigStrengths,'MaxRange',5000,Resolution="auto");
% coverage(tx3,type_coverage,"SignalStrengths",sigStrengths,'MaxRange',5000,Resolution="auto");
% coverage(tx4,type_coverage,"SignalStrengths",sigStrengths,'MaxRange',5000,Resolution="auto");
% coverage(tx5,type_coverage,"SignalStrengths",sigStrengths,'MaxRange',5000,Resolution="auto");
% coverage(tx6,type_coverage,"SignalStrengths",sigStrengths,'MaxRange',5000,Resolution="auto");
% coverage(tx7,type_coverage,"SignalStrengths",sigStrengths,'MaxRange',5000,Resolution="auto");
% 

%--------------------------------------------------
% Analyze Signal Strength and Effect of Materials
%--------------------------------------------------


rtpm = propagationModel("raytracing", ...
    "Method","sbr", ...
    "MaxNumReflections",5, ...
    "BuildingsMaterial","perfect-reflector", ...
    "TerrainMaterial","perfect-reflector");
mobile_station1=[39.729737,-8.933877]
mobile_station2=[39.751871,-8.929764]
mobile_station3=[39.747704,-8.913621]
mobile_station4=[39.728791,-8.940529]
mobile_station5=[39.727580,-8.940578]

% mobile_station1=[39.740883,-8.940578]
% mobile_station2=[39.751871,-8.929764]
% mobile_station3=[39.747704,-8.913621]
% mobile_station4=[39.728791,-8.940529]
% mobile_station5=[39.727580,-8.940578]

vetor_lat=[mobile_station1(1),mobile_station2(1),mobile_station3(1),mobile_station4(1),mobile_station5(1)]
vetor_long=[mobile_station1(2),mobile_station2(2),mobile_station3(2),mobile_station4(2),mobile_station5(2)]



for i = 1:length(vetor_long)
txmax=0;
eb1 = 0;
eb2 = 0;
eb3 = 0;
eb4 = 0;
eb5 = 0;
eb6 = 0;
eb7 = 0;
% rx = rxsite("Name","base_station"+i, ...
%        "Latitude",vetor_lat(1), ...
%        "Longitude",vetor_long(1), ...
%        'ReceiverSensitivity',-85, ...
%        "AntennaHeight",1);
   
% Analyze Signal Strength and Effect of Materials
%--------------------------------------------------



 ss1(i) = max(sigstrength(rx,tx1,rtpm));
 ss2(i) = max(sigstrength(rx,tx2,rtpm));
  ss3(i) = max(sigstrength(rx,tx3,rtpm));
 ss4(i) = max(sigstrength(rx,tx4,rtpm));
  ss5(i) = max(sigstrength(rx,tx5,rtpm));
 ss6(i) = max(sigstrength(rx,tx6,rtpm));
  ss7(i) = max(sigstrength(rx,tx7,rtpm));
 
     ss8(i) = ss1(i);
     ss9(i) = ss2(i);
     ss10(i) = ss3(i);
     ss11(i) = ss4(i);
     ss12(i) = ss5(i);
     ss13(i) = ss6(i);
     ss14(i) = ss7(i);
 
% if (ss8(i) > ss9(i) && ss8(i) > ss10(i)&&ss8(i) > ss11(i)&&ss8(i) > ss12(i)&&ss8(i) > ss13(i)&&ss8(i) > ss14(i))
% eb1 = eb1 +1;
%  elseif (ss9(i) > ss8(i) && ss9(i) > ss10(i)&&ss9(i) > ss11(i)&&ss9(i) > ss12(i)&&ss9(i) > ss13(i)&&ss9(i) > ss14(i))
%    eb2 = eb2 +1;
%   elseif (ss10(i) > ss9(i) && ss10(i) > ss8(i)&&ss10(i) > ss13(i)&&ss10(i) > ss11(i)&&ss10(i) > ss12(i)&&ss10(i) > ss14(i))
%    eb3 = eb3 +1;
%   elseif (ss11(i) > ss9(i) && ss11(i) > ss10(i)&&ss11(i) > ss8(i)&&ss11(i) > ss12(i)&&ss11(i) > ss13(i)&&ss11(i) > ss14(i))
%    eb4 = eb4 +1;
%   elseif (ss12(i) > ss9(i) && ss12(i) > ss10(i)&&ss12(i) > ss11(i)&&ss12(i) > ss8(i)&&ss12(i) > ss13(i)&&ss12(i) > ss14(i))
%    eb5 = eb5 +1;
%   elseif (ss13(i) > ss9(i) && ss13(i) > ss10(i)&& ss13(i) > ss11(i)&&ss13(i) > ss12(i)&&ss13(i) > ss13(i)&&ss8(i) > ss14(i))
%    eb6 = eb6 +1;
%  elseif (ss14(i) > ss9(i) && ss14(i) > ss10(i)&&ss14(i) > ss11(i)&&ss14(i) > ss12(i)&&ss14(i) > ss13(i)&&ss14(i) > ss8(i))
%    eb7 = eb7 +1;
%  else
%      eb1 = eb1;
%      eb2 = eb2;
%        eb3 = eb3;
%      eb4 = eb4;
%        eb5 = eb5;
%      eb6 = eb6;
%  eb7 = eb7;
%  end
 
if (ss8(i) > ss9(i) && ss8(i) > ss10(i)&&ss8(i) > ss11(i)&&ss8(i) > ss12(i)&&ss8(i) > ss13(i)&&ss8(i) > ss14(i))
eb1 = eb1 +1;
txmax=tx1
end
 if (ss9(i) > ss8(i) && ss9(i) > ss10(i)&&ss9(i) > ss11(i)&&ss9(i) > ss12(i)&&ss9(i) > ss13(i)&&ss9(i) > ss14(i))
   eb2 = eb2 +1;
   txmax=tx2
 end
if (ss10(i) > ss9(i) && ss10(i) > ss8(i)&&ss10(i) > ss13(i)&&ss10(i) > ss11(i)&&ss10(i) > ss12(i)&&ss10(i) > ss14(i))
   eb3 = eb3 +1;
   txmax=tx3
end
  if (ss11(i) > ss9(i) && ss11(i) > ss10(i)&&ss11(i) > ss8(i)&&ss11(i) > ss12(i)&&ss11(i) > ss13(i)&&ss11(i) > ss14(i))
   eb4 = eb4 +1;
   txmax=tx4
  end
  if (ss12(i) > ss9(i) && ss12(i) > ss10(i)&&ss12(i) > ss11(i)&&ss12(i) > ss8(i)&&ss12(i) > ss13(i)&&ss12(i) > ss14(i))
   eb5 = eb5 +1;
    txmax=tx5
  end
  if (ss13(i) > ss9(i) && ss13(i) > ss10(i)&& ss13(i) > ss11(i)&&ss13(i) > ss12(i)&&ss13(i) > ss13(i)&&ss8(i) > ss14(i))
   eb6 = eb6 +1;
    txmax=tx6
  end
 if (ss14(i) > ss9(i) && ss14(i) > ss10(i)&&ss14(i) > ss11(i)&&ss14(i) > ss12(i)&&ss14(i) > ss13(i)&&ss14(i) > ss8(i))
   eb7 = eb7 +1;
 txmax=tx7
 end

%  raytrace([txmax], rx, rtpm) 
%  raytrace([tx1,tx2,tx3,tx4,tx5,tx6,tx7], rx, rtpm) 
% PtMedEb1 = PtMedEb1 + ss5(i);
 disp('Best server for mobile_station')
   disp(i)
 

  if (eb1 > eb2 && eb1 > eb3 && eb1 > eb4&&eb1 > eb5&&eb1 > eb2 && eb1 > eb2&&eb1 > eb7)
   
    disp('Best server eb1')
  end
if (eb2 > eb1&&eb2 > eb3&&eb2 > eb4&&eb2 > eb5&&eb2 > eb6 && eb2 > eb7)
      disp('Best server eb2')
end
      
if (eb3 > eb2&&eb3 > eb1&&eb3 > eb4&&eb3 > eb5&&eb3 > eb2&&eb3 > eb7)
   disp('Best server eb3')
end
 if (eb4 > eb2&&eb4 > eb3&&eb4 > eb1&&eb4 > eb5&&eb4 > eb2&&eb4 > eb7)
    disp('Best server eb4')
 end
 if (eb5 > eb2&&eb5 > eb3&&eb5 > eb4&&eb5 > eb5&&eb5 > eb2&&eb5 > eb7)
    disp('Best server eb5')
 end
  if (eb6 > eb2&&eb6 > eb3&&eb6 > eb4&&eb6 > eb5&&eb6 > eb1&&eb6 > eb7)
    disp('Best server eb6')
  end
   if (eb7 > eb2&&eb7 > eb3&&eb7 > eb4&&eb7 > eb5&&eb7 > eb6&&eb7 > eb1)
 disp('Best server eb7')
end
end
 
plot(ss1)
hold on
plot(ss2)
hold on
plot(ss3)
hold on
plot(ss4)
hold on
plot(ss5)
hold on
plot(ss6)
hold on
plot(ss7)
hold off

title('Handover')
xlabel('NÂº de Recetores') 
ylabel('PotÃªncia Recebida (dBm)')
legend({'Eb1','Eb2','Eb3','Eb4','Eb5','Eb6','Eb7'},'Location','southwest')  



% pattern(tx1,fq1)
% pattern(tx2,fq2)
% pattern(tx3,fq3)
% pattern(tx4,fq4)
% pattern(tx5,fq5)
% pattern(tx6,fq6)
% pattern(tx7,fq7)




