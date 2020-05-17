%生成1024*1024传输矩阵
K=K_gen(32);
KH=K';  %K矩阵的转置共轭矩阵
%生成输入场
img=imread('32.png');
img=rgb2gray(img);
img=im2double(img);
%经过散射体得到输出场
out=two_dimen(K*one_dimen(img),32,32);
%将输出场反向传播得到输入场
in=two_dimen(KH*one_dimen(out),32,32);
%反向传播得到的输入场与原始输入场之差
diff=abs(img-abs(in));
subplot(2,2,1),imshow(img);title('原始输入场');
subplot(2,2,2),imshow(abs(out));title('输出场');
subplot(2,2,3),imshow(abs(in));title('反向传播得到输入场');
subplot(2,2,4),imshow(diff);title('原始输入场与反向传播得到输入场之差');
