clear all;
f0=0.5;
dt=0.001;
f=-f0:dt:f0;
omega=2*pi*f;
N=256;
W_B=(1/N)*(sin(omega*N/2)./sin(omega/2)).^2;
pks=findpeaks(W_B);
side_lobe_max=10*log10(max(pks));
n0=size(f)-1;
n=n0(2)/2;
W_B=20*log10(W_B/W_B(n));
B=1;
for i=n:2*n % find the Bandwidth (3dB)
    if W_B(i+2) > -3
        B=B+1;
    else
        break;
    end
end
B=B*dt*2;
plot(omega,W_B,'Linewidth',1,'Color','blue');
ylim([-100 0]);xlim([-3 3]);
grid on;
xlabel('Angular Frequency(\omega)');ylabel('W_B(\omega)/W_B(0),(dB)');
title(['N = ',num2str(N),', Bandwidth(3dB) = ',num2str(B), ...
    ', The Peak of Side Lobe Is (dB): ', num2str(side_lobe_max)]);
