function r=PLI_analysis(s1,s2)
%%%%%%%%%%%%% 对S1和S2进行PLI分析
%%%%%%%%%%%% auth:曹国智
tnum=length(s1);
%% s1希尔伯特变换
S1_Hilbert=hilbert(s1);
S1_real=real(S1_Hilbert);
S1_imag=imag(S1_Hilbert);
phase1=atan2(S1_imag,S1_real);
%% s2希尔伯特变换
S2_Hilbert=hilbert(s2);
S2_real=real(S2_Hilbert);
S2_imag=imag(S2_Hilbert);
phase2=atan2(S2_imag,S2_real);
%% 瞬时相位差
phase12=phase1-phase2;

L=length(phase12);
for m=1:4                        %将相位差调整到±pi之间，可能不需要；
for i=1:L
    if phase12(i,1)>=pi
        phase12(i,1)=phase12(i,1)-2*pi;
    elseif phase12(i,1)<-pi
        phase12(i,1)=phase12(i,1)+2*pi;
    end
end
end

%% PLI
x=sign(phase12);
for i=1:tnum
    y=sum(x(1:i,1))/i;
    r(i,1)=abs(y);
end

