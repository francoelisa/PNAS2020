clear all
close all

%%% DATE OF PLOT %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Date='0401';
DThreshold=.2; % THRESHOLD FOR DEATHS

Data

% SELECT DATA ABOVE THRESHOLD
nItalyDeaths=nItalyDeaths(find(nItalyDeaths>DThreshold));
nGermanyDeaths=nGermanyDeaths(find(nGermanyDeaths>DThreshold));
nFranceDeaths=nFranceDeaths(find(nFranceDeaths>DThreshold));
nSpainDeaths=nSpainDeaths(find(nSpainDeaths>DThreshold));
nUKDeaths=nUKDeaths(find(nUKDeaths>DThreshold));
nUSDeaths=nUSDeaths(find(nUSDeaths>DThreshold));
nSKDeaths=nSKDeaths(find(nSKDeaths>DThreshold));
nJapanDeaths=nJapanDeaths(find(nJapanDeaths>DThreshold));

TimeSpan=[1:1:15];
nItalyDeaths=nItalyDeaths(TimeSpan);
nFranceDeaths=nFranceDeaths(TimeSpan);
nSpainDeaths=nSpainDeaths(TimeSpan);



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%       EXPONENTIAL FIT       %%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Exp = @(b,time)(b(1)*exp((time)./b(2)));
b0=[.2 5]; % INITIAL CONDITION
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% ITALY
timeItaly=[1:length(nItalyDeaths)];
[bItaly,residual,J,CovB,MSE,ErrorModelInfo]= nlinfit(timeItaly,nItalyDeaths,Exp,b0);
nItalyFit=bItaly(1)*exp((timeItaly)./bItaly(2));


% GERMANY
timeGermany=[1:length(nGermanyDeaths)];
[bGermany,residual,J,CovB,MSE,ErrorModelInfo]= nlinfit(timeGermany,nGermanyDeaths,Exp,b0);
nGermanyFit=bGermany(1)*exp((timeGermany)./bGermany(2));

% FRANCE
timeFrance=[1:length(nFranceDeaths)];
[bFrance,residual,J,CovB,MSE,ErrorModelInfo]= nlinfit(timeFrance,nFranceDeaths,Exp,b0);
nFranceFit=bFrance(1)*exp((timeFrance)./bFrance(2));

% Spain
timeSpain=[1:length(nSpainDeaths)];
[bSpain,residual,J,CovB,MSE,ErrorModelInfo]= nlinfit(timeSpain,nSpainDeaths,Exp,b0);
nSpainFit=bSpain(1)*exp((timeSpain)./bSpain(2));

% UK
timeUK=[1:length(nUKDeaths)];
[bUK,residual,J,CovB,MSE,ErrorModelInfo]= nlinfit(timeUK,nUKDeaths,Exp,b0);
nUKFit=bUK(1)*exp((timeUK)./bUK(2));

% US
timeUS=[1:length(nUSDeaths)];
[bUS,residual,J,CovB,MSE,ErrorModelInfo]= nlinfit(timeUS,nUSDeaths,Exp,b0);
nUSFit=bUS(1)*exp((timeUS)./bUS(2));


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% PLOT %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SETTINGS 
FontForPlot='Arial';
FSize=18;
LW=1; % Width of lines
MSize=4; % Size of marker
Height=15;
Width=20;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(1)
 
plot(nSKDeaths,'d-','Color',rgb('Gray'),'Linewidth',LW);%, 'MarkerFaceColor',rgb('Gray'))
hold on
plot(nJapanDeaths,'d-','Color',rgb('Black'),'Linewidth',LW);% 'MarkerFaceColor',rgb('Black'))

plot(nItalyDeaths,'d-','Color',rgb('DodgerBlue'),'Linewidth',LW);% 'MarkerFaceColor',rgb('DodgerBlue'))
hold on
plot(nItalyFit,':','Color',rgb('DodgerBlue'),'Linewidth',LW);% 'MarkerFaceColor',rgb('DodgerBlue'))
hold on
hold on
plot(nGermanyDeaths,'d-','Color',rgb('Crimson'),'Linewidth',LW);% 'MarkerFaceColor',rgb('Crimson'))
hold on
plot(nGermanyFit,':','Color',rgb('Crimson'),'Linewidth',LW);% 'MarkerFaceColor',rgb('Crimson'))
hold on
 
plot(nFranceDeaths,'d-','Color',rgb('Navy'),'Linewidth',LW);% 'MarkerFaceColor',rgb('Navy'))
hold on
plot(nFranceFit,':','Color',rgb('Navy'),'Linewidth',LW);% 'MarkerFaceColor',rgb('Navy'))
hold on

plot(nSpainDeaths,'d-','Color',rgb('Orchid'),'Linewidth',LW);% 'MarkerFaceColor',rgb('Orchid'))
hold on
plot(nSpainFit,':','Color',rgb('Orchid'),'Linewidth',LW);% 'MarkerFaceColor',rgb('Orchid'))
hold on

plot(nUKDeaths,'d-','Color',rgb('Green'),'Linewidth',LW);% 'MarkerFaceColor',rgb('Green'))
hold on
plot(nUKFit,':','Color',rgb('Green'),'Linewidth',LW);% 'MarkerFaceColor',rgb('Green'))
hold on

plot(nUSDeaths,'d-','Color',rgb('Orange'),'Linewidth',LW);% 'MarkerFaceColor',rgb('Orange'))
hold on
plot(nUSFit,':','Color',rgb('Orange'),'Linewidth',LW);% 'MarkerFaceColor',rgb('Orange'))

 

xlim([1 TimeSpan(end)])
legend(...
    ['South Korea'],...
    ['Japan'],...
    ['Italy'], ['T_d=' num2str(round(log(2)*bItaly(2),1))],...
    ['Germany'],['T_d=' num2str(round(log(2)*bGermany(2),1))],...
    ['France'],['T_d=' num2str(round(log(2)*bFrance(2),1))],...
    ['Spain'],['T_d=' num2str(round(log(2)*bSpain(2),1))],...
    ['UK'],['T_d=' num2str(round(log(2)*bUK(2),1))],...
    ['USA'], ['T_d=' num2str(round(log(2)*bUS(2),1))],...
     'Location','bestoutside');


legend boxoff
 
ylabel('d=deaths/million')
xlabel(['First ' num2str(TimeSpan(end)) ' days since reported d >' num2str(DThreshold)])


set(gca,'FontName', FontForPlot,'FontSize',FSize);

%%%% PDF %%%%%%%%%%%%%
set(gcf, 'PaperUnits', 'centimeters'); % SETS THE PAPER UNITS
set(gcf, 'PaperPosition', [0 0 1.2*Width Height]); % SETS THE FIGURE SIZE
set(gcf, 'PaperSize', [1.2*Width Height]); % CUTS THE FIGURE
print(gcf,'-dpdf', [ Date 'DeathsByCountry_Linear_Fitted.pdf']) % PRINTS TO A FILE.
%%%%%%%%%%%%%%%%%%%%%%%
 



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% LOG PLOT %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(2)
semilogy(nSKDeaths,'d-','Color',rgb('Gray'),'Linewidth',LW);% 'MarkerFaceColor',rgb('Gray'))
 hold on
 semilogy(nJapanDeaths,'d-','Color',rgb('Black'),'Linewidth',LW);% 'MarkerFaceColor',rgb('Black'))

semilogy(nItalyDeaths,'d-','Color',rgb('DodgerBlue'),'Linewidth',LW);% 'MarkerFaceColor',rgb('DodgerBlue'))
 hold on
semilogy(nItalyFit,':','Color',rgb('DodgerBlue'),'Linewidth',LW);% 'MarkerFaceColor',rgb('DodgerBlue'))

semilogy(nGermanyDeaths,'d-','Color',rgb('Crimson'),'Linewidth',LW);% 'MarkerFaceColor',rgb('Crimson'))
semilogy(nGermanyFit,':','Color',rgb('Crimson'),'Linewidth',LW);% 'MarkerFaceColor',rgb('Crimson'))

semilogy(nFranceDeaths,'d-','Color',rgb('Navy'),'Linewidth',LW);% 'MarkerFaceColor',rgb('Navy'))
semilogy(nFranceFit,':','Color',rgb('Navy'),'Linewidth',LW);% 'MarkerFaceColor',rgb('Navy'))

semilogy(nSpainDeaths,'d-','Color',rgb('Orchid'),'Linewidth',LW);% 'MarkerFaceColor',rgb('Orchid'))
semilogy(nSpainFit,':','Color',rgb('Orchid'),'Linewidth',LW);% 'MarkerFaceColor',rgb('Orchid'))

semilogy(nUKDeaths,'d-','Color',rgb('Green'),'Linewidth',LW);% 'MarkerFaceColor',rgb('Green'))
semilogy(nUKFit,':','Color',rgb('Green'),'Linewidth',LW);% 'MarkerFaceColor',rgb('Green'))

semilogy(nUSDeaths,'d-','Color',rgb('Orange'),'Linewidth',LW);% 'MarkerFaceColor',rgb('Orange'));
semilogy(nUSFit,':','Color',rgb('Orange'),'Linewidth',LW);% 'MarkerFaceColor',rgb('Orange'));


axis tight
xlim([1 TimeSpan(end)])

legend boxoff
set(gca,'FontName', FontForPlot,'FontSize',1.5*FSize);
xlim([1 TimeSpan(end)])


%%%% PDF %%%%%%%%%%%%%
set(gcf, 'PaperUnits', 'centimeters'); % SETS THE PAPER UNITS
set(gcf, 'PaperPosition', [0 0 Width Height]); % SETS THE FIGURE SIZE
set(gcf, 'PaperSize', [Width Height]); % CUTS THE FIGURE
print(gcf,'-dpdf', [ Date 'DeathsByCountry_Log_Fitted.pdf']) % PRINTS TO A FILE.
%%%%%%%%%%%%%%%%%%%%%%%







