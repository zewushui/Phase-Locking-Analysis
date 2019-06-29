%%%%%%%%%% ��ͬ����������  %%%%%%%%%%%%%%%%%
%%%%%%%%%% auth���ܹ���  %%%%%%%%%%%%
%% ��ʼ��
clc;clear;close all
tic
warning off
fs=1200;          %����Ƶ��
L=10;             % ����ǿ��
circlr_num=5;
t=linspace(0,circlr_num*2*pi,circlr_num*fs);
t=t';
%% �����ź�
[s1,s2]=Signal_Generate(t,L);
%% ��ͬ�����ָ������
r(:,1)=phase_analysis(s1,s2,fs);
%% PLI
r(:,2)=PLI_analysis(s1,s2);
%% wPLI
r3=wPLI_analysis(s1,s2);
%% ȡ����ֵ��Ϊ���
result1=num2str(r(end,1));
result2=num2str(r(end,2));
result3=num2str(r3(end,1));
%% ��ͼL=0
subplot(4,1,1)
plot(s1,'linewidth',1.5);
hold on
plot(s2,'linewidth',1.5);
title('�ź�   fs: 10Hz  ����ˮƽ:  10');
% axis([1,120,-1.2,1.2]);
xlim([1 120])
set(gca,'xtick',[0,24,48,72,96,120],'xticklabel',[0 0.02 0.04 0.06 0.08 0.1]);
xlabel('Time/Sec')
set(gca,'fontsize',12)
%% ��ͼ ��ͬ�����
subplot(4,1,2);
plot(r(:,1),'r','linewidth',1.5);
xlim([1,1200]);
ylim([0,1])
title(['��ͬ�����ָ�� R= ' result1]);
set(gca,'xtick',[0,240,480,720,960,1200],'xticklabel',[0 0.2 0.4 0.6 0.8 1]);
xlabel('Time/Sec')
set(gca,'fontsize',12)
%% ��ͼPLI
subplot(4,1,3);
plot(r(:,2),'r','linewidth',1.5);
xlim([1,1200]);
ylim([0,1])
title(['PLI = ' result2]);
set(gca,'xtick',[0,240,480,720,960,1200],'xticklabel',[0 0.2 0.4 0.6 0.8 1]);
xlabel('Time/Sec')
set(gca,'fontsize',12)
%% ��ͼwPLI
subplot(4,1,4)
plot(r3,'r','linewidth',1.5);
xlim([1,1200]);
ylim([0,1])
title(['wPLI L= ' result3]);
set(gca,'xtick',[0,240,480,720,960,1200],'xticklabel',[0 0.2 0.4 0.6 0.8 1]);
xlabel('Time/Sec')
set(gca,'fontsize',12);
toc