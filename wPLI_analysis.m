function r1=wPLI_analysis(s1,s2)
%%%%%%%%%%%%% 对S1和S2进行wPLI分析
%%%%%%%%%%%% auth:曹国智
tnum=length(s1);
r1=zeros(tnum,1);
for i=32:tnum
    tmp1=s1(1:i,1);
     tmp2=s2(1:i,1);
%% s1 FFT
lengen=length(tmp1);
SpectrumAmp1=fft(tmp1)/(lengen/2);
SpectrumAmp1=SpectrumAmp1(1:lengen/2);
%% s2 FFT
lengen=length(tmp2);
SpectrumAmp2=fft(tmp2)/(lengen/2);
SpectrumAmp2=SpectrumAmp2(1:lengen/2);
%% 正交谱计算
c=cpsd(SpectrumAmp1,SpectrumAmp2);
c_imag=imag(c);
%% wPLI指数
tmp1=abs(sum(c_imag));
tmp2=(sum(abs(c_imag)));
r1(i,1)=tmp1/tmp2;
end
%% 第二种计算方法
%% s1希尔伯特变换
S1_Hilbert=hilbert(s1);
S1_real=real(S1_Hilbert);
S1_imag=imag(S1_Hilbert);
phase1=atan(S1_imag./S1_real);
%% s2希尔伯特变换
S2_Hilbert=hilbert(s2);
S2_real=real(S2_Hilbert);
S2_imag=imag(S2_Hilbert);
phase2=atan(S2_imag./S2_real);
%% 瞬时相位差
phase12=phase1-phase2;
L=length(phase12);
for i=1:L
    if phase12(i,1)>pi/2
        phase12(i,1)=phase12(i,1)-pi;
    elseif phase12(i,1)<-pi/2
        phase12(i,1)=phase12(i,1)+pi;
    end
end
r2=abs(sin(phase12))./sin(phase12);
r3=abs(mean(r2));


