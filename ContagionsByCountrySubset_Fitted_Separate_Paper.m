clear all
close all

IThreshold=2; %  THRESHOLD FOR INFECTIONS
%%% DATE OF PLOT %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Date='0401';

Data

% SELECT DATA ABOVE THRESHOLD
nItaly=nItaly(find(nItaly>IThreshold));
nGermany=nGermany(find(nGermany>IThreshold));
nFrance=nFrance(find(nFrance>IThreshold));
nSpain=nSpain(find(nSpain>IThreshold));
nUK=nUK(find(nUK>IThreshold));
nUS=nUS(find(nUS>IThreshold));
nSK=nSK(find(nSK>IThreshold));
nJapan=nJapan(find(nJapan>IThreshold));


TimeSpan=[1:1:20]; % TAKE FIRST 20 DAYS 
nItaly=nItaly(TimeSpan);
nGermany=nGermany(TimeSpan);
nFrance=nFrance(TimeSpan);
nSpain=nSpain(TimeSpan);
nUK=nUK(TimeSpan);
nUS=nUS(TimeSpan); % US 
nSK=nSK(TimeSpan);
nJapan=nJapan(TimeSpan);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%       EXPONENTIAL FIT       %%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
Exp = @(b,time)(b(1)*exp((time)./b(2)));  
b0=[1 5];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ITALY
timeItaly=[1:length(nItaly)];
[bItaly,residual,J,CovB,MSE,ErrorModelInfo]= nlinfit(timeItaly,nItaly,Exp,b0);
nItalyFit=bItaly(1)*exp((timeItaly)./bItaly(2));

% South Korea

timeSK=[1:length(nSK)];
[bSK,residual,J,CovB,MSE,ErrorModelInfo]= nlinfit(timeSK,nSK,Exp,b0);
nSKFit=bSK(1)*exp((timeSK)./bSK(2));

% GERMANY 
timeGermany=[1:length(nGermany)];
[bGermany,residual,J,CovB,MSE,ErrorModelInfo]= nlinfit(timeGermany,nGermany,Exp,b0);
nGermanyFit=bGermany(1)*exp((timeGermany)./bGermany(2));

% FRANCE
timeFrance=[1:length(nFrance)];
[bFrance,residual,J,CovB,MSE,ErrorModelInfo]= nlinfit(timeFrance,nFrance,Exp,b0);
nFranceFit=bFrance(1)*exp((timeFrance)./bFrance(2));

% Spain
timeSpain=[1:length(nSpain)];
[bSpain,residual,J,CovB,MSE,ErrorModelInfo]= nlinfit(timeSpain,nSpain,Exp,b0);
nSpainFit=bSpain(1)*exp((timeSpain)./bSpain(2));

% UK
timeUK=[1:length(nUK)];
[bUK,residual,J,CovB,MSE,ErrorModelInfo]= nlinfit(timeUK,nUK,Exp,b0);
nUKFit=bUK(1)*exp((timeUK)./bUK(2));

% US
timeUS=[1:length(nUS)];
[bUS,residual,J,CovB,MSE,ErrorModelInfo]= nlinfit(timeUS,nUS,Exp,b0);
nUSFit=bUS(1)*exp((timeUS)./bUS(2));

% % Iran
% timeIran=[1:length(nIran)];
% [bIran,residual,J,CovB,MSE,ErrorModelInfo]= nlinfit(timeIran,nIran,Exp,b0);
% nIranFit=bIran(1)*exp((timeIran)./bIran(2));

% Japan
timeJapan=[1:length(nJapan)];
[bJapan,residual,J,CovB,MSE,ErrorModelInfo]= nlinfit(timeJapan,nJapan,Exp,b0);
nJapanFit=bJapan(1)*exp((timeJapan)./bJapan(2));


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



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
figure(1)
% NOT FITTED
plot(nSK,'o-','Color',rgb('Gray'),'MarkerSize',MSize,'Linewidth',LW)
hold on
plot(nJapan,'o-','Color',rgb('Black'),'MarkerSize',MSize,'Linewidth',LW)
hold on
%------------------------------------------------------

plot(nItaly,'o-','Color',rgb('DodgerBlue'),'MarkerSize',MSize,'Linewidth',LW)
hold on
plot(nItalyFit,':','Color',rgb('DodgerBlue'),'MarkerSize',MSize,'Linewidth',LW);

plot(nGermany,'o-','Color',rgb('DarkRed'),'MarkerSize',MSize,'Linewidth',LW)
hold on
plot(nGermanyFit,':','Color',rgb('DarkRed'),'MarkerSize',MSize,'Linewidth',LW);

plot(nFrance,'o-','Color',rgb('Navy'),'MarkerSize',MSize,'Linewidth',LW)
hold on
plot(nFranceFit,':','Color',rgb('Navy'),'MarkerSize',MSize,'Linewidth',LW);

plot(nSpain,'o-','Color',rgb('Orchid'),'MarkerSize',MSize,'Linewidth',LW)
hold on
plot(nSpainFit,':','Color',rgb('Orchid'),'MarkerSize',MSize,'Linewidth',LW);

plot(nUK,'o-','Color',rgb('Green'),'MarkerSize',MSize,'Linewidth',LW)
hold on
plot(nUKFit,':','Color',rgb('Green'),'MarkerSize',MSize,'Linewidth',LW);

plot(nUS,'o-','Color',rgb('Orange'),'MarkerSize',MSize,'Linewidth',LW)
hold on
plot(nUSFit,':','Color',rgb('Orange'),'MarkerSize',MSize,'Linewidth',LW);

xlim([1 TimeSpan(end)])
 


legend(...
['South Korea'], ... %['T_d=' num2str(round(log(2)*bSK(2),1))],...
['Japan'], ... %['T_d=' num2str(round(log(2)*bJapan(2),1))],...
['Italy'], ['T_d=' num2str(round(log(2)*bItaly(2),1))],...
['Germany'],['T_d=' num2str(round(log(2)*bGermany(2),1))],...
['France'],['T_d=' num2str(round(log(2)*bFrance(2),1))],...
['Spain'],['T_d=' num2str(round(log(2)*bSpain(2),1))],...
['UK'],['T_d=' num2str(round(log(2)*bUK(2),1))],...
['USA'],['T_d=' num2str(round(log(2)*bUS(2),1))],...
'Location','bestoutside');


legend boxoff

ylabel('i = infections/million')
xlabel(['First ' num2str(TimeSpan(end)) ' days since reported i >' num2str(IThreshold)])

set(gca,'FontName', FontForPlot,'FontSize',FSize);

%%%% PDF %%%%%%%%%%%%%
set(gcf, 'PaperUnits', 'centimeters'); % SETS THE PAPER UNITS
set(gcf, 'PaperPosition', [0 0 1.2*Width Height]); % SETS THE FIGURE SIZE
set(gcf, 'PaperSize', [1.2*Width Height]); % CUTS THE FIGURE
print(gcf,'-dpdf', [ Date 'ContagionsByCountry_Linear_Fitted.pdf']) % PRINTS TO A FILE.
%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% LOG PLOT %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

figure(2)
% NOT FITTED
semilogy(nSK,'o-','Color',rgb('Gray'),'MarkerSize',MSize,'Linewidth',LW)
hold on
semilogy(nJapan,'o-','Color',rgb('Black'),'MarkerSize',MSize,'Linewidth',LW);
%------------------------------------------------------
semilogy(nItaly,'o-','Color',rgb('DodgerBlue'),'MarkerSize',MSize,'Linewidth',LW)
semilogy(nItalyFit,':','Color',rgb('DodgerBlue'),'MarkerSize',MSize,'Linewidth',LW);
semilogy(nGermany,'o-','Color',rgb('DarkRed'),'MarkerSize',MSize,'Linewidth',LW)
semilogy(nGermanyFit,':','Color',rgb('DarkRed'),'MarkerSize',MSize,'Linewidth',LW);
semilogy(nFrance, 'Color',rgb('Navy'),'MarkerSize',MSize,'Linewidth',LW)
semilogy(nFranceFit,':','Color',rgb('Navy'),'MarkerSize',MSize,'Linewidth',LW);
semilogy(nSpain,'o-','Color',rgb('Orchid'),'MarkerSize',MSize,'Linewidth',LW)
semilogy(nSpainFit,':','Color',rgb('Orchid'),'MarkerSize',MSize,'Linewidth',LW);
semilogy(nUK,'o-','Color',rgb('Green'),'MarkerSize',MSize,'Linewidth',LW)
semilogy(nUKFit,':','Color',rgb('Green'),'MarkerSize',MSize,'Linewidth',LW);
semilogy(nUS,'o-','Color',rgb('Orange'),'MarkerSize',MSize,'Linewidth',LW);
semilogy(nUSFit,':','Color',rgb('Orange'),'MarkerSize',MSize,'Linewidth',LW);
xlim([1 TimeSpan(end)])

legend boxoff
 
set(gca,'FontName', FontForPlot,'FontSize',1.5*FSize);
xlim([1 TimeSpan(end)])


%%%% PDF %%%%%%%%%%%%%
set(gcf, 'PaperUnits', 'centimeters'); % SETS THE PAPER UNITS
set(gcf, 'PaperPosition', [0 0 Width Height]); % SETS THE FIGURE SIZE
set(gcf, 'PaperSize', [Width Height]); % CUTS THE FIGURE
print(gcf,'-dpdf', [ Date 'ContagionsByCountry_Log_Fitted.pdf']) % PRINTS TO A FILE.
%%%%%%%%%%%%%%%%%%%%%%%





