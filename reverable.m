%����1024*1024�������
K=K_gen(32);
KH=K';  %K�����ת�ù������
%�������볡
img=imread('32.png');
img=rgb2gray(img);
img=im2double(img);
%����ɢ����õ������
out=two_dimen(K*one_dimen(img),32,32);
%����������򴫲��õ����볡
in=two_dimen(KH*one_dimen(out),32,32);
%���򴫲��õ������볡��ԭʼ���볡֮��
diff=abs(img-abs(in));
subplot(2,2,1),imshow(img);title('ԭʼ���볡');
subplot(2,2,2),imshow(abs(out));title('�����');
subplot(2,2,3),imshow(abs(in));title('���򴫲��õ����볡');
subplot(2,2,4),imshow(diff);title('ԭʼ���볡�뷴�򴫲��õ����볡֮��');
