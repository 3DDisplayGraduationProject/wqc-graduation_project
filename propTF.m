function[u2]=propTF(u1,L,lambda,z)
% propagation - transfer function approach
% assumes same x and y side lengths and 
% uniform sampling 
% u1 - source plane field
% L - source and observation plane side length
% lambda - wavelength
%                                                                        
% u2 - observation plane field

[M,N]=size(u1);     %����ⳡ����Ĵ�С
dx=L/M;             %sampling interval
k=2*pi/lambda;

fx=-1/(2*dx):1/L:1/(2*dx)-1/L; %freq coordinates
[FX,FY]=meshgrid(fx,fx);

H=exp(-j*pi*lambda*z*(FX.^2+FY.^2)); %trans func
H=fftshift(H);      %shifted trans func
U1=fft2(fftshift(u1)); %shift, fft source field
U2=H.*U1;           %multiply ���Ϊɶ��h����ߣ�����(��Ϊ��˲������ң������ͬ)
u2=ifftshift(ifft2(U2));
end


