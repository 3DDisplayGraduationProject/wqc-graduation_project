clc;
clear;
%%
% 透镜焦距f=0.1m
% 选取f/#，即f/2*wl=5
% 波长500nm
% 窗口长度0.05m
% 每边采样数64个 
% 原图加均值相位0.5
% 经过透镜，幅值不变，有效数据被孔径过滤掉，同时相位值被调整
% 有效孔径不用管，后期模拟相位值的调整
%%
% 全局数据声明
lambda=500e-6;      %波长
k=2*pi/lambda;      %波数
L=0.05;            %取样窗口边长
M=64;               %每边采样数
zf=0.1;
w=0.05;                             %half-length of the square aperture
%%
% 获得处理后的目标相位面数据
dx=L/M;
x=-L/2:dx:L/2-dx;
y=x;
[X,Y]=meshgrid(x,y);

g1=imread('strip','jpg');
g1=imcrop(g1,[0 0 256 256]);
g1=imresize(g1,0.25);
g1=rgb2gray(g1);
u1=im2double(g1);
u1=flipud(u1);            %reverse row order

% u1=rect(X/(2*w)).*rect(Y/(2*w));    %source field

for i=1:M
    for j=1:M
        u1(i,j)=complex(u1(i,j),0.5);
    end
end


u_lens=focus(u1,L,lambda,zf);
u_lens_amp=abs(u_lens);
u_lens_phi=angle(u_lens);
%%
% TM输入

% 无orth 相位调制不随机 可逆
% KR=textread('C:\Users\stacy\Documents\MATLAB\tset\KR.txt','%f');
% KI=textread('C:\Users\stacy\Documents\MATLAB\tset\KI.txt','%f');

% 有orth 相位调制随机 可逆
KR=textread('C:\Users\stacy\Documents\MATLAB\tset\KR_orth.txt','%f');
KI=textread('C:\Users\stacy\Documents\MATLAB\tset\KI_orth.txt','%f');

TM=complex(KR,KI);
TM=two_dimen(TM,M*M,M*M);
TMH=TM';
% %%
% % 前向传播过程
% SLM=zeros(50,50);
% SLM=SLM+0.1;
% 
% u_slm=u1.*exp(1i*SLM);
% u_out=TM*one_dimen(u_slm);
% 
% u_slm_amp=abs(u_slm);
% u_slm_phi=angle(u_slm);
% 
% u_out=two_dimen(u_out,M,M);
% u_out_amp=abs(u_out);
% u_out_phi=angle(u_out);
% %%
% figure(1)
% subplot(2,2,1),imagesc(u_slm_amp);axis square;axis xy;colormap('jet');title('uslmamp');
% subplot(2,2,2),imagesc(u_slm_phi);axis square;axis xy;colormap('jet');title('uslmphi');
% subplot(2,2,3),imagesc(u_out_amp);axis square;axis xy;colormap('jet');title('uoutamp');
% subplot(2,2,4),imagesc(u_out_phi);axis square;axis xy;colormap('jet');title('uoutphi');
%%
% 反向直接求解
u_lens_back1=TMH*one_dimen(u_lens);
u_lens_forward1=TM*u_lens_back1;

u_lens_back1=two_dimen(u_lens_back1,M,M);
ub1_amp=abs(u_lens_back1);
ub1_phi=angle(u_lens_back1);

u_lens_forward1=two_dimen(u_lens_forward1,M,M);
uf1_amp=abs(u_lens_forward1);
uf1_phi=angle(u_lens_forward1);

SLM=ub1_phi-0.5;

uslm=u1.*exp(1i*SLM);
u_out=two_dimen(TM*one_dimen(uslm),M,M);
u_out_amp=abs(u_out);
u_out_phi=angle(u_out);

%%
% 输出焦面图像并对比
u_lens_focus=Fersnel_prop(u_lens,L,lambda,zf);
I_LENS=abs(u_lens_focus).^2;
u_out_focus=Fersnel_prop(u_out,L,lambda,zf);
I_OUT=abs(u_out_focus).^2;

%%
% figure(2)
% subplot(4,2,1),imagesc(ub1_amp);axis square;axis xy;colormap('jet');title('ub1 amp');
% subplot(4,2,2),imagesc(ub1_phi);axis square;axis xy;colormap('jet');title('ub1 mphi');
% subplot(4,2,3),imagesc(uf1_amp);axis square;axis xy;colormap('jet');title('uf1 amp');
% subplot(4,2,4),imagesc(uf1_phi);axis square;axis xy;colormap('jet');title('uf1 phi');
% subplot(4,2,5),imagesc(u_lens_amp);axis square;axis xy;colormap('jet');title('ulens amp');
% subplot(4,2,6),imagesc(u_lens_phi);axis square;axis xy;colormap('jet');title('ulens phi');
% subplot(4,2,7),imagesc(u_out_amp);axis square;axis xy;colormap('jet');title('uout amp');
% subplot(4,2,8),imagesc(u_out_phi);axis square;axis xy;colormap('jet');title('uout phi');

figure(3)
subplot(2,2,1),imagesc(I_LENS);axis square;axis xy;colormap('jet');title('I LENS');
subplot(2,2,2),mesh(x,y,I_LENS);
subplot(2,2,3),imagesc(I_OUT);axis square;axis xy;colormap('jet');title('I OUT');
subplot(2,2,4),mesh(x,y,I_OUT);

figure(4)
subplot(2,2,1),imagesc(u_lens_amp);axis square;axis xy;colormap('jet');title('ulens amp');
subplot(2,2,2),imagesc(u_lens_phi);axis square;axis xy;colormap('jet');title('ulens phi');
subplot(2,2,3),imagesc(u_out_amp);axis square;axis xy;colormap('jet');title('uout amp');
subplot(2,2,4),imagesc(u_out_phi);axis square;axis xy;colormap('jet');title('uout phi');
%%
% 评估模型
% I_LENS=I_LENS/max(max(I_LENS));
% I_OUT=I_OUT/max(max(I_OUT));
I_LENS1=MAXMINnormalize(I_LENS);
I_OUT1=MAXMINnormalize(I_OUT);
i_diff=abs(I_LENS1-I_OUT1);
mse=0;
for k3=1:M
    for k4=1:M
        mse=mse+i_diff(k3,k4)^2;
    end
end
mse=mse/(64*64);

% count=0;
% for k1=1:M
%     for k2=1:M
%         if(abs(u_out_amp(k1,k2)-1)<0.2)
%             count=count+1;
%         end
%     end
% end

