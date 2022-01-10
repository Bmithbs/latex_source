function acs=genacs(M, sigma, a, b)
h = filter([1;b(:)],[1,a(:)],[1;zeros(M,1)]);
acs = sigma*conv(h,flipud(conj(h)));
plot(acs);
xlabel('k');
ylabel('r(k)');
title(['a_1=',num2str(a),', b_1=', num2str(b),',M=',num2str(M)]);
grid on;