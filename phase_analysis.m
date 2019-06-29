function r=phase_analysis(s1,s2,fs)
%%%%%%%%%%%%% ��S1��S2������ͬ��ָ������
%%%%%%%%%%%% auth:�ܹ���
tnum=length(s1);
%% s1ϣ�����ر任
S1_Hilbert=hilbert(s1);
S1_real=real(S1_Hilbert);
S1_imag=imag(S1_Hilbert);
phase1=atan2(S1_imag,S1_real);
%% s2ϣ�����ر任
S2_Hilbert=hilbert(s2);
S2_real=real(S2_Hilbert);
S2_imag=imag(S2_Hilbert);
phase2=atan2(S2_imag,S2_real);

%% ˲ʱ��λ��
phase12=phase1-phase2;
L=length(phase12);
for m=1:4                       %����λ���������pi֮�䣬���ܲ���Ҫ��
for i=1:L
    if phase12(i,1)>=pi
        phase12(i,1)=phase12(i,1)-2*pi;
    elseif phase12(i,1)<-pi
        phase12(i,1)=phase12(i,1)+2*pi;
    end
end
end
%% ��ͬ�����ָ��
delter_t=1/fs;
for i=1:tnum
     rmatrix=1i*phase12(1:i,1);
      x=exp(rmatrix);
     r(i,1) = abs(mean(x));
     %     sinx=mean(sin(phase12(1:i,:)));       %�ڶ����㷨
%     cosx=mean(cos(phase12(1:i,:)));
%     r2(i,1)=(sinx).^2+(cosx).^(0.5);
end


