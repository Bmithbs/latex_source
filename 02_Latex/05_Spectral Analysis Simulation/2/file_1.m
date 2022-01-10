clear all;
f0=0.2;
a1=1;
a2=01;
phi_1=0;
phi_2=0;
alpha=12;
sigma=0;    %��׼��
N=128;      %�����ĵ���
fs=1;       %����Ƶ��fs
dt=1/fs;    %�������
t=(0:N-1)*dt; %��N��������
y=a1*sin(f0*2*pi*t+phi_1)+a2*sin((f0+alpha/N)*2*pi*t+phi_2)...
+randn(1,N)*sigma; %�������������
H=chebwin(length(y));% ������
y=y.*H';% �Ӵ�

M=20*N;
Y_w=fft(y,M); %������Ƶ��
P2=abs(Y_w).^2/M;
P1=P2(1:M/2+1); %����Ƶ��
P1(2:end-1)=2*P1(2:end-1);
f=(0:(M/2))/M*fs;
Amax=10*log10(P1); %��һ�������ֵdB
plot(f,Amax,'LineWidth',1);
%xlim([0.1 0.3])
%ylim([-30 010]);
xlabel('Frequency(HZ)');
ylabel('Amplitude(dB)');
title('')
%title(['a_1=',num2str(a1),', a_2=',num2str(a2),...
%    ', \alpha=',num2str(alpha/fs)]);
grid on;
% M=20*N;
% Y_w=fft(H,M); %������Ƶ��
% P2=abs(Y_w).^2/M;
% P1=P2(1:M/2+1); %����Ƶ��
% P1(2:end-1)=2*P1(2:end-1);
% f=(0:(M/2))/M*fs;
% Amax=10*log10(P1); %��һ�������ֵdB
% plot(f,Amax,'LineWidth',1,'Color','red');hold on;
% grid on;title('The Chebwin Window Frequency Response');
% ff=-f;
% plot(ff,Amax,'LineWidth',1,'Color','red');
% xlabel('Frequency (Hz)');ylabel('10log_{10}(W(t)/W(0))');
% xlim([-0.2 0.2]);ylim([-150 10]);



