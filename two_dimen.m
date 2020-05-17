function[F]=two_dimen(S,n1,n2)
% 将一维列向量变化为n1*n2的二维矩阵
F=zeros(n1,n2);
count2=1;
for i=1:n1
    for j=1:n2
        F(i,j)=S(count2,1);
        count2=count2+1;
        if count2>n1*n2
            break;
        end
    end
end