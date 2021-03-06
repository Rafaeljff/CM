
fqmax = 960e6; % 960 mhz máximo freq de uplink
Fdiv=25e6/7;
Safeguard_band=20e3;
%utilização de 7 agregados por célula portanto 925 Mhz-960 Mhz está reservado
%para 7 divisões de canal pela célula logo: fqmax-fqmin = 960Mhz-935Mhz = 25 Mhz 
% 25 Mhz dedicados para cada canal. Mas cada canal está abrangido por uma distância entre
%frequências  de 20Khz, pelo que cada canal tem um largura de
%banda F= (25MhZ / 7) -(20e3)=3.55Mhz

%Subdibidiu se cada celula entre a gama de frequencias do GSM para um  maior aproveitamento  possível do espetro de frequências do GSM900
%uma vez que assim permite uma maior capacidade de trafego, pois existem
%mais canais disponiveis e possivel mais utilizadores em simultâneo


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
% 
% fq1=fqmin;
% fq2=fqmax;
% fq3=fqmin;
% fq4=fqmax;
% fq5=fqmin;
% fq6=fqmax;
% fq7=fqmin;


% fq8=fqmin+Fdiv;
% fq9=fq1+Fdiv+Safeguard_band;
% fq10=fq2+Fdiv+Safeguard_band;
% fq11=fq3+Fdiv+Safeguard_band;
% fq12=fq4+Fdiv+Safeguard_band;
% fq13=fq5+Fdiv+Safeguard_band;
% fq14=fq6+Fdiv;

% fq15=fqmin+Fdiv;
% fq16=fq1+Fdiv+Safeguard_band;
% fq17=fq2+Fdiv+Safeguard_band;
% fq18=fq3+Fdiv+Safeguard_band;
% fq19=fq4+Fdiv+Safeguard_band;
% fq20=fq5+Fdiv+Safeguard_band;
% fq21=fq6+Fdiv;

% fq22=fqmin+Fdiv;
% fq23=fq1+Fdiv+Safeguard_band;
% fq24=fq2+Fdiv+Safeguard_band;
% fq25=fq3+Fdiv+Safeguard_band;
% fq26=fq4+Fdiv+Safeguard_band;
% fq27=fq5+Fdiv+Safeguard_band;
% fq28=fq6+Fdiv;





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


ant7 = design(reflector,fq7);
ant7.Tilt = [90 90 90]; % roda 90%
ant7.TiltAxis = [1 0 0;0 1 0; 0 0 1];

% ant8 = design(reflector,fq7);
% ant8.Tilt = [90 90 180]; % roda 90%
% ant8.TiltAxis = [1 0 0;0 1 0; 0 0 1];
% 
% ant9 = design(reflector,fq7);
% ant9.Tilt = [90 90 270]; % roda 90%
% ant9.TiltAxis = [1 0 0;0 1 0; 0 0 1];
% 
% ant10 = design(reflector,fq7);
% ant10.Tilt = [90 90 0]; % roda 90%
% ant10.TiltAxis = [1 0 0;0 1 0; 0 0 1];
%As frequencias de cada estação base serão reutilizadas na próxima estação logo
%é essencial fazer um bom planeamento para não haver interferencia entre
%celulas com frequencias identicas para diferentes estações base que
%estejam adjacentes.
tx1 = txsite("NAME","eb1", ...
    "Latitude",39.756624, ...
    "Longitude",-8.925917, ...
    "Antenna",ant1,...  %cada antena tem 
    "AntennaHeight",20, ...        % Units: meters
    "TransmitterFrequency",fq1,... % Units: Hz
    "TransmitterPower",40);  
show(tx1)
tx2 = txsite("NAME","eb2", ...
    "Latitude",39.741866, ...
    "Longitude",-8.947965, ...
    "Antenna",ant2,...  %cada antena tem 
    "AntennaHeight",20, ...        % Units: meters
    "TransmitterFrequency",fq2,... % Units: Hz
    "TransmitterPower",40);      
show(tx2)
tx3 = txsite("NAME","eb3", ...
    "Latitude",39.723532, ...
    "Longitude",-8.948699, ...
    "Antenna",ant3,...  %cada antena tem 
    "AntennaHeight",20, ...        % Units: meters
    "TransmitterFrequency",fq3,... % Units: Hz
    "TransmitterPower",40);      
show(tx3)

tx4 = txsite("NAME","eb4", ...
    "Latitude",39.74725490767334, ...
    "Longitude",-8.904104, ...
    "Antenna",ant4,...  %cada antena tem 
    "AntennaHeight",20, ...        % Units: meters
    "TransmitterFrequency",fq4,... % Units: Hz
    "TransmitterPower",40); 
show(tx4)
tx5 = txsite("NAME","eb5", ...
    "Latitude",39.726750, ...
    "Longitude",-8.910540, ...
    "Antenna",ant5,...  %cada antena tem 
    "AntennaHeight",20, ...        % Units: meters
    "TransmitterFrequency",fq5,... % Units: Hz
    "TransmitterPower",40);    
show(tx5)
tx6 = txsite("NAME","eb6", ...
    "Latitude",39.718087, ...
    "Longitude",-8.928441, ...
    "Antenna",ant6,...  %cada antena tem 
    "AntennaHeight",20, ...        % Units: meters
    "TransmitterFrequency",fq6,... % Units: Hz
    "TransmitterPower",40);    
show(tx6)
tx7 = txsite("NAME","eb7", ...
    "Latitude",39.736382, ...
    "Longitude",-8.925263, ...
    "Antenna",ant6,...  %cada antena tem 
    "AntennaHeight",20, ...        % Units: meters
    "TransmitterFrequency",fq6,... % Units: Hz
    "TransmitterPower",40);      
show(tx7)
% Display radiation pattern
pattern([ant1],fq1)

%  
%  rtpm = propagationModel("raytracing", ...
%     "Method","sbr", ...
%     "MaxNumReflections",5, ...
%     "BuildingsMaterial","perfect-reflector", ...
%     "TerrainMaterial","perfect-reflector");
% rtpm=propagationModel("freespace");
  rtpm=propagationModel("longley-rice");
min=-85;
max_signal=-5;
sigStrengths = min:max_signal;
% 
% mobile_station1=[39.729737,-8.933877];
% mobile_station2=[39.751871,-8.929764];
% mobile_station3=[39.747704,-8.913621];
% mobile_station4=[39.728791,-8.940529];
% mobile_station5=[39.727580,-8.940578];
% mobile_station6=[39.743557,-8.926605];
% mobile_station7=[39.743485,-8.934339];
% mobile_station8=[39.741273,-8.942068];
% mobile_station9=[39.755197,-8.919140];
% mobile_station10=[39.770808,-8.928322];
% mobile_station11=[39.737751,-8.919463];
% mobile_station12=[39.735732,-8.927932];
% mobile_station13=[39.729881,-8.913313];
% mobile_station14=[39.765471,-8.928580];
% mobile_station15=[39.761938,-8.931814];
% mobile_station16=[39.761702,-8.938305];
% mobile_station17=[39.755156,-8.937538];
% mobile_station18=[39.749722,-8.940810];
% mobile_station19=[39.737363,-8.934079];
% mobile_station20=[39.722418,-8.926832];
% mobile_station21=[39.724877,-8.928703];
% mobile_station23=[39.712071,-8.909261];
% mobile_station22=[39.719485,-8.932681];
% mobile_station24=[39.728909,-8.921429];
% mobile_station25=[39.733244,-8.910754];
% mobile_station26=[39.719632,-8.923625];
% mobile_station27=[39.785752,-8.927395];
% 
% vetor_lat=[mobile_station1(1),mobile_station2(1),mobile_station3(1),mobile_station4(1),...
%     mobile_station5(1),mobile_station6(1),mobile_station7(1),mobile_station8(1),mobile_station9(1),...
%     mobile_station10(1),mobile_station11(1),mobile_station12(1),mobile_station13(1),mobile_station14(1),...
%     mobile_station15(1),mobile_station16(1),mobile_station17(1),mobile_station18(1),mobile_station19(1),...
%     mobile_station20(1),mobile_station21(1),mobile_station22(1),mobile_station23(1),mobile_station24(1),...
%     mobile_station25(1),mobile_station26(1),mobile_station27(1)];
% vetor_long=[mobile_station1(2),mobile_station2(2),mobile_station3(2),mobile_station4(2),...
%     mobile_station5(2),mobile_station6(2),mobile_station7(2),mobile_station8(2),mobile_station9(2),...
%     mobile_station10(2),mobile_station11(2),mobile_station12(2),mobile_station13(2),mobile_station14(2),...
%     mobile_station15(2),mobile_station16(2),mobile_station17(2),mobile_station18(2),mobile_station19(2),...
%     mobile_station20(2),mobile_station21(2),mobile_station22(2),mobile_station23(2),mobile_station24(2),...
%     mobile_station25(2),mobile_station26(2),mobile_station27(2)];
% 


road1=[39.747910,-8.928726];
road2=[39.747290,-8.931145];
road3=[39.746928,-8.932979];
road4=[39.745544,-8.934768];
road5=[39.744400,-8.935278];
road6=[39.743061,-8.935503];
road7=[39.741831,-8.935298];
road8=[39.740715,-8.934845];
road9=[39.739747,-8.934352];
road10=[39.738558,-8.933837];
road11=[39.737409,-8.933314];
road12=[39.736228,-8.932931];
road13=[39.734982,-8.932587];
road14=[39.733941,-8.932700];
road15=[39.733301,-8.932885];
road16=[39.732359,-8.933057];
road17=[39.731657,-8.933102];
road18=[39.730905,-8.933198];
road19=[39.730265,-8.933288];
road20=[39.729577,-8.933402];
road21=[39.729119,-8.933441];
road22=[39.728517,-8.933532];
road23=[39.727791,-8.933618];
road24=[39.726896,-8.933704];
road25=[39.725776,-8.933860];
road26=[39.724401,-8.934116];
road27=[39.725089,-8.933982];
road28=[39.724401,-8.934116];
road29=[39.724191,-8.934759];
road30=[39.723878,-8.935673];
road31=[39.723587,-8.936664];
road32=[39.723267,-8.937719];
road33=[39.722955,-8.938955];
road34=[39.722930,-8.940214];
road35=[39.722999,-8.941232];
road36=[39.723074,-8.942235];
road37=[39.723054,-8.943191];
road38=[39.723102,-8.944496];
road39=[39.723211,-8.946067];
road40=[39.723282,-8.947381];



vetor_lat=[road1(1),road2(1),road3(1),road4(1),...
 road5(1),road6(1),road7(1),road8(1),road9(1),...
 road10(1),road11(1),road12(1),road13(1),road14(1),...
 road15(1),road16(1),road17(1),road18(1),road19(1),...
 road20(1),road21(1),road22(1),road23(1),road24(1),...
 road25(1),road26(1),road27(1),road28(1),road29(1),road30(1),...
 road31(1),road32(1),road33(1),road34(1),road35(1),road36(1),...
 road37(1),road38(1),road39(1),road40(1)];

vetor_long=[road1(2),road2(2),road3(2),road4(2),...
  road5(2),road6(2),road7(2),road8(2),road9(2),...
  road10(2),road11(2),road12(2),road13(2),road14(2),...
  road15(2),road16(2),road17(2),road18(2),road19(2),...
  road20(2),road21(2),road22(2),road23(2),road24(2),...
   road25(2),road26(2),road27(2),road28(2),road29(2),road30(2),...
 road31(2),road32(2),road33(2),road34(2),road35(2),road36(2),...
 road37(2),road38(2),road39(2),road40(2)];



coverage([tx1,tx2,tx3,tx4,tx5,tx6,tx7],rtpm,"SignalStrengths",sigStrengths,'MaxRange',3000,Resolution="auto");
pattern(tx1,fq1)
pattern(tx2,fq2)
pattern(tx3,fq3)
pattern(tx4,fq4)
pattern(tx5,fq5)
pattern(tx6,fq6)
pattern(tx7,fq7)

   %potencia total de cada estacao base inicializada a zero
PtMedEb1 = 0;
PtMedEb2 = 0;
PtMedEb3 = 0;
PtMedEb4 =0;
PtMedEb5 = 0;
PtMedEb6 = 0;
PtMedEb7 = 0;
n1= 0;
n2= 0;
n3= 0;
n4= 0;
n5= 0;
n6= 0;
n7= 0;

  for i = 1:length(vetor_long)
txmax=0;
    eb1 = 0;
    eb2 = 0;
    eb3 = 0;
    eb4 = 0;
    eb5 = 0;
    eb6 = 0;
    eb7 = 0;
  
    rx = rxsite("Name","mobile station"+i, ...
       "Latitude",vetor_lat(i), ...
       "Longitude",vetor_long(i), ...
       'ReceiverSensitivity',-85, ...
       "AntennaHeight",1);
    
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


% Potencia total de transmissao por cada estacao base  e incrementada em funcao dos
%   recetores
%  PtMedEb1 = PtMedEb1+ss1(i);
%  PtMedEb2 = PtMedEb2+ss2(i);
%  PtMedEb3 = PtMedEb3+ss3(i);
%  PtMedEb4 = PtMedEb4+ss4(i);
%  PtMedEb5 = PtMedEb5+ss5(i);
%  PtMedEb6 = PtMedEb6+ss6(i);
%  PtMedEb7 = PtMedEb7+ss7(i);

% 
    if (ss8(i) > ss9(i) && ss8(i) > ss10(i)&&ss8(i) > ss11(i)&&ss8(i) > ss12(i)&&ss8(i) > ss13(i)&&ss8(i) > ss14(i))
        eb1 = eb1 +1;
    PtMedEb1 = PtMedEb1+ss1(i);
   n1=n1+1;
    elseif (ss9(i) > ss8(i) && ss9(i) > ss10(i)&&ss9(i) > ss11(i)&&ss9(i) > ss12(i)&&ss9(i) > ss13(i)&&ss9(i) > ss14(i))
        eb2 = eb2 +1;

 PtMedEb2 = PtMedEb2+ss2(i);
  n2=n2+1
    elseif (ss10(i) > ss9(i) && ss10(i) > ss8(i) && ss10(i) > ss13(i) && ss10(i) > ss11(i)&&ss10(i) > ss12(i)&&ss10(i) > ss14(i))
        eb3 = eb3 +1;
 PtMedEb3 = PtMedEb3+ss3(i);
    n3=n3+1
    elseif (ss11(i) > ss9(i) && ss11(i) > ss10(i)&&ss11(i) > ss8(i)&&ss11(i) > ss12(i)&&ss11(i) > ss13(i)&&ss11(i) > ss14(i))
        eb4 = eb4 +1;
 PtMedEb4 = PtMedEb4+ss4(i);
   n4=n4+1
    elseif (ss12(i) > ss9(i) && ss12(i) > ss10(i)&&ss12(i) > ss11(i)&&ss12(i) > ss8(i)&&ss12(i) > ss13(i)&&ss12(i) > ss14(i))
        eb5 = eb5 +1;
 PtMedEb5 = PtMedEb5+ss5(i);
n5=n5+1
    elseif (ss13(i) > ss9(i) && ss13(i) > ss10(i)&& ss13(i) > ss11(i)&&ss13(i) > ss12(i)&&ss13(i) > ss8(i)&&ss13(i) > ss14(i))
        eb6 = eb6 +1;
 PtMedEb6 = PtMedEb6+ss6(i);
  n6=n6+1
    elseif (ss14(i) > ss9(i) && ss14(i) > ss10(i)&&ss14(i) > ss11(i)&&ss14(i) > ss12(i)&&ss14(i) > ss13(i)&&ss14(i) > ss8(i))
        eb7 = eb7 +1;
   PtMedEb7 = PtMedEb7+ss7(i);
  n7=n7+1
    end

% 
%     disp("Best server for mobile_station "+i)
%  
% 
    if (eb1 > eb2 && eb1 > eb3 && eb1 > eb4&&eb1 > eb5&& eb1 > eb6&&eb1 > eb7)
   txmax=tx1;
    
   disp('Best server eb1')
    end
    if (eb2 > eb1 && eb2 > eb3 && eb2 > eb4 && eb2 > eb5 && eb2 > eb6 && eb2 > eb7)
        disp('Best server eb2')
   txmax=tx2;
    end

    if (eb3 > eb2&&eb3 > eb1&&eb3 > eb4&&eb3 > eb5&&eb3 > eb6&&eb3 > eb7)
        disp('Best server eb3')
        txmax=tx3;
    end
    if (eb4 > eb2&&eb4 > eb3&&eb4 > eb1 && eb4 > eb5&&eb4 > eb6 && eb4 > eb7)
        disp('Best server eb4')
        txmax=tx4;
    end
    if (eb5 > eb2 && eb5 > eb3 && eb5 > eb4 && eb5 > eb1 && eb5 > eb2 && eb5 > eb7)
        disp('Best server eb5')
        txmax=tx5;
    end
    if (eb6 > eb2 && eb6 > eb3&&eb6 > eb4&&eb6 > eb5 && eb6 > eb1&&eb6 > eb7)
        disp('Best server eb6')
        txmax=tx6;
    end
    if (eb7 > eb2 && eb7 > eb3 && eb7 > eb4 && eb7 > eb5 && eb7 > eb6 && eb7 > eb1)
        disp('Best server eb7')
        txmax=tx7;
    end
    % %     raytrace([tx1,tx2,tx3,tx4,tx5,tx6,tx7],rx, rtpm)
  sc = [0 0.9 0];
 
    link(rx,txmax,rtpm,"SuccessColor",sc);

 show(rx);
    end
 
%---------------------------------------------------------------------------------------------
 %Para as potencias totais de cada estacao base referentes a potencia transmitida para moveis
 %sera convertida em  potencia media em funcao do numero de recetores
 %existentes


% plot(PtMedEb1,length(vetor_long)) 
% hold on
% plot(PtMedEb2,length(vetor_long))
% hold on
% plot(PtMedEb3,length(vetor_long))
% hold on
% plot(PtMedEb4,length(vetor_long))
% plot(ss4)
% hold on
% plot(PtMedEb5,length(vetor_long))
% plot(ss5)
% hold on
% plot(PtMedEb6,length(vetor_long))
% hold on
% plot(PtMedEb7,length(vetor_long))
% hold off

% 
% title('Handover')
% xlabel('Numero de Recetores') %n
% ylabel('Potencia Recebida (dBm)')%
% % legend({'Eb1','Eb2','Eb3','Eb4','Eb5','Eb6','Eb7'},'Location','southwest')  
% legend({'Eb2','Eb3','Eb6','Eb7'},'Location','southwest')  

 
 % PTMed=PTtotal/n
 %Potencia erradiada por todas as estações ao longo dos recetores
% Ptglobaleb1 = PtMedEb1/length(vetor_long);
% Ptglobaleb1 = PtMedEb2/length(vetor_long);
% Ptglobaleb1 = PtMedEb3/length(vetor_long);
% Ptglobaleb1 = PtMedEb4/length(vetor_long);
% Ptglobaleb1 = PtMedEb5/length(vetor_long);
% Ptglobaleb1 = PtMedEb6/length(vetor_long);
% Ptglobaleb1 = PtMedEb7/length(vetor_long);
  %Potencia erradiada por todas as estações ao longo dos recetores

PtMedTotaleb1 = PtMedEb1/n1;
 PtMedTotaleb2 = PtMedEb2/n2;
 PtMedTotaleb3 = PtMedEb3/n3;
PtMedTotaleb4 = PtMedEb4/n4;
 PtMedTotaleb5 = PtMedEb5/n5;
 PtMedTotaleb6 = PtMedEb6/n6;
PtMedTotaleb7 = PtMedEb7/n7;

if (n1==0)
disp("potencia média erradiada por eb1 é nula");
else
disp("potencia média erradiada por eb1:"+PtMedTotaleb1+"dbm")
plot(ss1)
hold on
end
if (n2 ==0)
disp("potencia média erradiada por eb2 é nula");
else
disp("potencia média erradiada por eb2:"+PtMedTotaleb2+"dbm");
plot(ss2)
hold on
end

if (n3 ==0)
disp("potencia média erradiada por eb3 é nula");
else
disp("potencia média erradiada por eb3:"+PtMedTotaleb3+"dbm");
plot(ss3)
hold on
end
if (n4 ==0)
disp("potencia média erradiada por eb4 é nula");
else
    disp("potencia média erradiada por eb4:"+PtMedTotaleb4+"dbm");
plot(ss4)
hold on
end
if (n5 ==0)
disp("potencia média erradiada por eb5 é nula");
else
disp("potencia média erradiada por eb5:"+PtMedTotaleb5+"dbm");
  plot(ss5)
hold on
end
if (n6 ==0)
disp("potencia média erradiada por eb6 é nula");
else
    plot(ss6)
hold on
   disp("potencia média erradiada por eb6:"+PtMedTotaleb6+"dbm");
end
if (n7 ==0)
disp("potencia média erradiada por eb7 é nula");
else
disp("potencia média erradiada por eb7:"+PtMedTotaleb7+"dbm");

plot(ss7)
hold on
end
hold off

title('Handover')
xlabel('Numero de Recetores') %n
ylabel('Potencia Recebida (dBm)')%
legend({'Eb1','Eb2','Eb3','Eb4','Eb5','Eb6','Eb7'},'Location','southwest')  
% 
% sinr([tx1,tx2,tx3,tx4,tx5,tx6,tx7],rtpm, ...
%    'MaxRange',5000, ...    
%   'Resolution',"auto")
