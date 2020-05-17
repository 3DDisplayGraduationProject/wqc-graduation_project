function[u2]=propTF(u1,L,lambda,z)
% propagation - transfer function approach
% assumes same x and y side lengths and 
% uniform sampling 
% u1 - source plane field
% L - source and observation plane side length
% lambda - wavelength
%                                                                        
% u2 - observation plane field

[M,N]=size(u1);     %输入光场矩阵的大小
dx=L/M;             %sampling interval
k=2*pi/lambda;

fx=-1/(2*dx):1/L:1/(2*dx)-1/L; %freq coordinates
[FX,FY]=meshgrid(fx,fx);

H=exp(-j*pi*lambda*z*(FX.^2+FY.^2)); %trans func
H=fftshift(H);      %shifted trans func
U1=fft2(fftshift(u1)); %shift, fft source field
U2=H.*U1;           %multiply 点乘为啥是h在左边？？？(因为点乘不分左右，结果相同)
u2=ifftshift(ifft2(U2));
end


