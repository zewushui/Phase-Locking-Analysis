%%%%%%%%%% 相同步分析仿真  %%%%%%%%%%%%%%%%%
%%%%%%%%%% auth：曹国智  %%%%%%%%%%%%
%% 初始化
clc;clear;close all
tic
warning off
fs=1200;          %采样频率
L=10;             % 噪声强度
circlr_num=5;
t=linspace(0,circlr_num*2*pi,circlr_num*fs);
t=t';
%% 产生信号
[s1,s2]=Signal_Generate(t,L);
%% 相同步相干指数分析
r(:,1)=phase_analysis(s1,s2,fs);
%% PLI
r(:,2)=PLI_analysis(s1,s2);
%% wPLI
r3=wPLI_analysis(s1,s2);
%% 取最终值作为结果
result1=num2str(r(end,1));
result2=num2str(r(end,2));
result3=num2str(r3(end,1));
%% 绘图L=0
subplot(4,1,1)
plot(s1,'linewidth',1.5);
hold on
plot(s2,'linewidth',1.5);
title('信号   fs: 10Hz  噪声水平:  10');
% axis([1,120,-1.2,1.2]);
xlim([1 120])
set(gca,'xtick',[0,24,48,72,96,120],'xticklabel',[0 0.02 0.04 0.06 0.08 0.1]);
xlabel('Time/Sec')
set(gca,'fontsize',12)
%% 绘图 相同步相干
subplot(4,1,2);
plot(r(:,1),'r','linewidth',1.5);
xlim([1,1200]);
ylim([0,1])
title(['相同步相干指数 R= ' result1]);
set(gca,'xtick',[0,240,480,720,960,1200],'xticklabel',[0 0.2 0.4 0.6 0.8 1]);
xlabel('Time/Sec')
set(gca,'fontsize',12)
%% 绘图PLI
subplot(4,1,3);
plot(r(:,2),'r','linewidth',1.5);
xlim([1,1200]);
ylim([0,1])
title(['PLI = ' result2]);
set(gca,'xtick',[0,240,480,720,960,1200],'xticklabel',[0 0.2 0.4 0.6 0.8 1]);
xlabel('Time/Sec')
set(gca,'fontsize',12)
%% 绘图wPLI
subplot(4,1,4)
plot(r3,'r','linewidth',1.5);
xlim([1,1200]);
ylim([0,1])
title(['wPLI L= ' result3]);
set(gca,'xtick',[0,240,480,720,960,1200],'xticklabel',[0 0.2 0.4 0.6 0.8 1]);
xlabel('Time/Sec')
set(gca,'fontsize',12);
toc