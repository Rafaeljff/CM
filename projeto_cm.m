

%largura de banda de frequência entre canais 
Safeguard_band=20e3;

%utilização de 7 agregados por célula portanto 925 Mhz-960 Mhz está reservado
%para 7 divisões de canal pela célula logo: fqmax-fqmin = 960Mhz-935Mhz = 25 Mhz 
% 25 Mhz dedicados para cada canal. Mas cada canal está abrangido por uma distância entre
%frequências  de 20Khz, pelo que cada canal tem um largura de
%banda F= (25MhZ / 7) -(20e3)=3.55Mhz

%Subdibidiu se cada celula entre  para o maioraproveitamento  possível do espetro de frequências do GSM900
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


fq7=fqmax-Fdiv;
fq6=fq7-Fdiv-Safeguard_band;
fq5=fq6-Fdiv-Safeguard_band;
fq4=fq5-Fdiv-Safeguard_band;
fq3=fq4-Fdiv-Safeguard_band;
fq2=fq3-Fdiv-Safeguard_band;
fq1=fqmin;


ant1=design(monopole, fq1);
ant1.Tilt = [90 90 0]; % roda 90%
ant1.TiltAxis = [1 0 0;0 1 0; 0 0 1]; % eixo dos xx yy zz ( mexer nos eixo ZZ para mudar a direção)

ant2 = design(monopole, fq2);
ant2.Tilt = [90 90 60]; % roda 90%
ant2.TiltAxis = [1 0 0;0 1 0; 0 0 1]; % eixo dos xx yy zz ( mexer nos eixo ZZ para mudar a direção)


ant3 = design(monopole,fq3);
ant3.Tilt = [90 90 120]; % roda 90%
ant3.TiltAxis = [1 0 0;0 1 0; 0 0 1]; % eixo dos xx yy zz ( mexer nos eixo ZZ para mudar a direção)

ant4 = design(monopole,fq4);
ant4.Tilt = [90 90 180]; % roda 90%
ant4.TiltAxis = [1 0 0;0 1 0; 0 0 1];

ant5 = design(monopole,fq5);
ant5.Tilt = [90 90 240]; % roda 90%
ant5.TiltAxis = [1 0 0;0 1 0; 0 0 1];

ant6 = design(monopole,fq6);
ant6.Tilt = [90 90 300]; % roda 90%
ant6.TiltAxis = [1 0 0;0 1 0; 0 0 1];

ant7 = design(monopole,fq7);
ant7.Tilt = [90 90 360]; % roda 90%
ant7.TiltAxis = [1 0 0;0 1 0; 0 0 1];

%------------------------------------------
% Antes setorizadas - Estação base 1
%------------------------------------------
% ant = design(reflectorSpherical, 3.4e9);
% ant.Tilt = [90 90 0]; % roda 90%
% ant.TiltAxis = [1 0 0;0 1 0; 0 0 1]; % eixo dos xx yy zz ( mexer nos eixo ZZ para mudar a direção)
% 
% ant2 = design(reflectorSpherical, 3.45e9);
% ant2.Tilt = [90 90 90]; % roda 90%
% ant2.TiltAxis = [1 0 0;0 1 0; 0 0 1]; % eixo dos xx yy zz ( mexer nos eixo ZZ para mudar a direção)
% 
% ant3 = design(reflectorSpherical, 3.50e9);
% ant3.Tilt = [90 90 180]; % roda 90%
% ant3.TiltAxis = [1 0 0;0 1 0; 0 0 1]; % eixo dos xx yy zz ( mexer nos eixo ZZ para mudar a direção)
% 
% ant4 = design(reflectorSpherical, 3.55e9);
% ant4.Tilt = [90 90 270]; % roda 90%
% ant4.TiltAxis = [1 0 0;0 1 0; 0 0 1]; % eixo dos xx yy zz ( mexer nos eixo ZZ para mudar a direção)

%------------------------------------------
% Antes setorizadas - Estação base 2
%------------------------------------------
% ant5 = design(reflectorSpherical, 3.4e9);
% ant5.Tilt = [90 90 0]; % roda 90%
% ant5.TiltAxis = [1 0 0;0 1 0; 0 0 1]; % eixo dos xx yy zz ( mexer nos eixo ZZ para mudar a direção)
% 
% ant6 = design(reflectorSpherical, 3.45e9);
% ant6.Tilt = [90 90 90]; % roda 90%
% ant6.TiltAxis = [1 0 0;0 1 0; 0 0 1]; % eixo dos xx yy zz ( mexer nos eixo ZZ para mudar a direção)
% 
% ant7 = design(reflectorSpherical, 3.50e9);
% ant7.Tilt = [90 90 180]; % roda 90%
% ant7.TiltAxis = [1 0 0;0 1 0; 0 0 1]; % eixo dos xx yy zz ( mexer nos eixo ZZ para mudar a direção)
% 
% ant8 = design(reflectorSpherical, 3.55e9);
% ant8.Tilt = [90 90 270]; % roda 90%
% ant8.TiltAxis = [1 0 0;0 1 0; 0 0 1]; % eixo dos xx yy zz ( mexer nos eixo ZZ para mudar a direção)



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

tx = txsite("NAME","MathWorks", ...
    "Latitude",39.74725490767334, ...
    "Longitude",-8.809335058401215, ...
    "Antenna",[ant1,ant2,ant3,ant4,ant5,ant6,ant7],...  %cada antena tem 
    "AntennaHeight",20, ...        % Units: meters
    "TransmitterFrequency",[fq1,fq2,fq3,fq4,fq5,fq6,fq7],... % Units: Hz
    "TransmitterPower",300);        % Units: Watts
% tx = txsite("Name","MathWorks", ...
%     "Latitude",39.74725490767334, ...
%     "Longitude",-8.809335058401215, ...
%     "Antenna",[ant1],...  %cada antena tem 
%     "AntennaHeight",20, ...        % Units: meters
%     "TransmitterFrequency",[fq1],... % Units: Hz
%     "TransmitterPower",40);        % Units: Watts

sensibility=-102 %dbm
max_signal=-5;
sigStrengths = sensibility:max_signal;

% Update coverage map
%free space
%coverage(tx,"freespace","SignalStrengths",sigStrengths,'MaxRange',500,Type='power');
%logely rice
%o máximo de alcance numa estação base pode ser até 30 km.
coverage(tx,"freespace","SignalStrengths",sigStrengths,'MaxRange',30000,Resolution="auto");
pattern(tx(1),fq1)
pattern(tx(2),fq2)
pattern(tx(3),fq3)
pattern(tx(4),fq4)
pattern(tx(5),fq5)
pattern(tx(6),fq6)
pattern(tx(7),fq7)





% vetor_long = [-8.651235948343789, -8.650813964303818,-8.650409481056043, ...
%                 -8.650004388890048, -8.649596107046358, ...
%                 -8.649189420037631, -8.648785922727447, ...
%                 -8.64838083056768, -8.64797254870016, ...
%                 -8.647564266835749, -8.647160769518827, ...
%                 -8.646758867079614, -8.646348990366914, ...
%                 -8.645945493036397, -8.645538806040625, ...
%                 -8.645130524174926, -8.644717457765088, ...
%                 -8.644317150164866, -8.643910463187233];
% 
% vetor_lat = [41.1764723160621,41.176120853778976,41.17578931908477, ...
%              41.17545919904554, 41.175130277791595, ...
%              41.17480015443118, 41.17446762848896, ...
%              41.17414110318228, 41.17381097483827, ...
%              41.17348324578104, 41.17315071315597, ...
%              41.17282178031094, 41.172491645317535, ...
%              41.17216270915656, 41.17183016983116, ...
%              41.171506032399506, 41.17117108870458, ...
%              41.17084334644257, 41.17051680307585];
%          
% 
% 
% 
% 
% 
% eb1 = 0;
% eb2 = 0;
% PtMedEb1 = 0;
% for i = 1:length(vetor_long)
%     
% rx = rxsite("Name","Small cell receiver", ...
%        "Latitude",vetor_lat(i), ...
%        "Longitude",vetor_long(i), ...
%        'ReceiverSensitivity',-100, ...
%        "AntennaHeight",1);
%    
%  ss1(i) = max(sigstrength(rx,tx,rtpm));
%  ss2(i) = max(sigstrength(rx,tx2,rtpm));
%  
%  
%  if ss1(i) == -inf
%     ss5(i) = -100;
%  else
%      ss5(i) = ss1(i);
%  end
%  
%  if ss2(i) == -inf
%     ss6(i) = -100;
%  else
%      ss6(i) = ss2(i);
%  end
%  
%  if ss5(i) > ss6(i)
%      eb1 = eb1 +1;
%  elseif ss5(i)< ss6(i)
%      eb2 = eb2 +1;
%  else
%      eb1 = eb1;
%      eb2 = eb2;
%  end
%  
%  
%  ss3(i) = min(sigstrength(rx,tx,rtpm));
%  ss4(i) = min(sigstrength(rx,tx2,rtpm));
% 
%  raytrace([tx, tx2], rx, rtpm) 
% 
% PtMedEb1 = PtMedEb1 + ss5(i);
%  
%  
% end
% PtMed = 0;
% PtMed = PtMedEb1/length(vetor_long);
% 
% if eb1 > eb2
%     disp('Best server eb1')
% elseif eb1 < eb2
%     disp('Best server eb2')
% else 
%     disp('eb1 = eb2')
% end
%     
% plot(ss1)
% hold on
% plot(ss2)
% hold off
% 
% title('Handover')
% xlabel('Nº de Recetores') 
% ylabel('Potência Recebida (dBm)')
% legend({'Estação Base 1','Estação Base 2'},'Location','southwest')  

%raytracing
%coverage(tx,"raytracing,"SignalStrengths",sigStrengths,'MaxRange',20,Type='power');

% sinr([tx,tx2],'longley-rice', ... %'longley-rice' freespace
%     'MaxRange',500, ...
%     'Resolution',"auto")