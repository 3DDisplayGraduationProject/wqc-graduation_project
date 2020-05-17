function[uout]=focus(uin,L,lambda,zf)
% converging or diverging phase-front
% uniform sampling
% uin - input field
% L - side length
% lambda - wavelength
% zf - focal distance(+ converge, - diverge)
% uout - output field
wl=zf/10;           % f/#=5
[M,N]=size(uin);
dx=L/M;
k=2*pi/lambda;

x=-L/2:dx:L/2-dx;
[X,Y]=meshgrid(x,x);

% uout=uin.*exp(-1i*k/(2*zf)*(X.^2+Y.^2)).*circ(sqrt(X.^2+Y.^2)/wl);
uout=uin.*exp(-1i*k/(2*zf)*(X.^2+Y.^2));

end