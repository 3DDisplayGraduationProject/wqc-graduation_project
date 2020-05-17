function [ u2 ] = Fersnel_prop( u1, L, lambda, z ); 
% FERSNEL_PROP
% assumes same x and y side lengths and
% uniform sampling
% u1 - source plane field
% L - source and observation plane side length
% lambda -wavelength
% z - propagation distance
% u2 - observation plane field

[M, N] = size(u1);
dx = L/M;
k = 2*pi/lambda;

fx = -1/(2*dx) : 1/L : 1/(2*dx) - 1/L; % freq coords
[FX, FY] = meshgrid(fx, fx);

H = exp(-1i*pi*lambda*z*(FX.^2 + FY.^2)); % trans func
H = fftshift(H);
U1 = fft2(fftshift(u1));
U2 = H.*U1;
u2 = ifftshift(ifft2(U2));

end

