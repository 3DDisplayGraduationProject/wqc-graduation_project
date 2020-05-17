function[u2]=propIR(u1,L,lambda,z);
% �����TF����˵��������΢��һ��Ĵ�����������µ�ģ�⣬����ģ�����ƺ����칤��ʱ�Ƚ�����
% propagation - impulse response approach
% assumes same x and y side lengths and
% uniform sampling
% u1 - source plane field
% L - source and obervation plane side length
% lambda - wavelength
% z - propagation distance
% u2 - observation plane field

[M,N]=size(u1);         %get input array size
dx=L/M;                 %sample interval
k=2*pi/lambda;          %wavenumber

x=-L/2:dx:L/2-dx;       %spatial coordinates
[X,Y]=meshgrid(x,x);    %������������

h=1/(j*lambda*z)*exp(j*k/(2*z)*(X.^2+Y.^2));
H=fft2(fftshift(h))*dx*dx; %��άһά����Ҫ������Ҫscale���
U1=fft2(fftshift(u1));
U2=H.*U1;
u2=ifftshift(ifft2(U2));
end