function r1=wPLI_analysis(s1,s2)
%%%%%%%%%%%%% ��S1��S2����wPLI����
%%%%%%%%%%%% auth:�ܹ���
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
%% �����׼���
c=cpsd(SpectrumAmp1,SpectrumAmp2);
c_imag=imag(c);
%% wPLIָ��
tmp1=abs(sum(c_imag));
tmp2=(sum(abs(c_imag)));
r1(i,1)=tmp1/tmp2;
end
%% �ڶ��ּ��㷽��
%% s1ϣ�����ر任
S1_Hilbert=hilbert(s1);
S1_real=real(S1_Hilbert);
S1_imag=imag(S1_Hilbert);
phase1=atan(S1_imag./S1_real);
%% s2ϣ�����ر任
S2_Hilbert=hilbert(s2);
S2_real=real(S2_Hilbert);
S2_imag=imag(S2_Hilbert);
phase2=atan(S2_imag./S2_real);
%% ˲ʱ��λ��
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


