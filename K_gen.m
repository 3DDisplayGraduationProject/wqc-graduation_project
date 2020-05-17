function[K]=K_gen(n)
%高斯随机数生成
random = normrnd(0,1,n^2+1,n^2+1); %输入输出矩阵维度均为n*n，因此K矩阵维度是nn*nn
random = (random - min(min(random)));
random = random/max(max(random));
%复高斯传输矩阵生成
phi = pi*2*random;
K=cos(phi)+sin(phi)*1i;
K=orth(K);
K=K(1:n^2,1:n^2);
% 
% [U S V]=svd(K);
% left=0;
% right=2;
% uper=2/pi;
% for k=1:n*n
%     x1=left+(right-left).*rand(1);
%     x2=uper*rand(1);
%     x3=(4-x1.^2).^(1/2)./pi;
%     while x2>x3
%         x1=left+(right-left).*rand(1);
%         x2=uper*rand(1);
%         x3=(4-x1.^2).^(1/2)./pi;
%     end
%     s(k)=x1;
% end
% s=s/max(max(s));
% S=diag(sort(s,'descend'));
% K=U*S*V;
end

