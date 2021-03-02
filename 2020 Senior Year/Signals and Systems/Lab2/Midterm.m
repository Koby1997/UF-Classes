


w = -pi:pi/1000:pi;
H1 = 1 - exp(-1j*w+1j*pi/3);
H2 = 1 - exp(-1j*w-1j*pi/3);
H = H1.*H2;
figure
subplot(2, 1, 1)
plot(w/pi, abs(H))
grid on
title('Magnitude Response')
xlabel('Normalized Radian Frequency (\times \pi rad/sample)')
ylabel('Amplitude')
subplot(2, 1, 2)
plot(w/pi, angle(H)/pi)
grid on
title('Phase Response')
xlabel('Normalized Radian Frequency (\times \pi rad/sample)')
ylabel('Phase (\times \pi rad)')