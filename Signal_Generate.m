function [signal_21,signal_22]=Signal_Generate(t,L)
%%%%%%%%%%%% auth:曹国智
%% 高斯噪声
tnum=length(t);
%% 方波
signal_11=square(2*pi*10*t+L,50);
signal_12=square(2*pi*10*t,50);
% signal_1=signal_1+wgn(tnum,1,-30);
%% sin
signal_21=sin(2*pi*10*t);
noise=L*2*(rand(tnum,1)-0.5);
signal_22=sin(2*pi*10*t+pi/12)+noise;
%% 三角波
signal_31=sawtooth(2*t,0.5);
signal_32=signal_31+L*rand(tnum,1);
%% 示例
s4=sin(2*pi*2*t)+0.2*sin(2*pi*40*t)+L*rand(tnum,1);
s5=sin(2*pi*2*t)+0.2*sin(2*pi*40*t)+L*rand(tnum,1);
%%
s6=sin(2*pi*2*(t+pi/6));
s7=sin(2*pi*2*t);