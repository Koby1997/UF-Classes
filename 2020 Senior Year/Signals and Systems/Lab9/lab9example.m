N =100; % signal length
M =128; % FFT size ( M >= N )
n =0: N -1; % discrete time vector
x = (0.8.^ n ) .* cos (0.5* pi * n ) ; % signal

% Calculate DFT and measure calculation time
tic ;
X_DFT = fft (x , M ) ;
toc ;

% Calculate DTFT and measure calculation time
w = - pi :2* pi / M : pi -2* pi / M ; % freq vector
tic ;
X_DTFT = dtft (x , w ) ;
toc ;

% Plot magnitude and phase of DTFT ( blue solid line ) and DFT ( red x )
figure(100);
subplot (2 , 1 , 1)
plot ( w / pi , fftshift ( abs ( X_DFT ) ) , 'rx ') ;
hold on ;
plot ( w / pi , abs ( X_DTFT ) , 'b - ') ;
hold off ;
grid on ;
title ( ' Magnitude ')
xlabel ( ' Normalized Radian Frequency (\ times \ pi rad / sample ) ') ;
ylabel ( ' Amplitude ') ;
legend ( ' DFT ' , ' DTFT ') ;
subplot (2 , 1 , 2)
plot ( w / pi , fftshift ( angle ( X_DFT ) / pi ) , 'rx ') ;
hold on ;
plot ( w / pi , angle ( X_DTFT ) / pi , 'b - ') ;
hold off ;
grid on ;
title ( ' Phase ')
xlabel ( ' Normalized Radian Frequency (\ times \ pi rad / sample ) ') ;
ylabel ( ' Phase (\ times \ pi rad ) ') ;
legend ( ' DFT ' , ' DTFT ') ;
