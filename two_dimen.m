function[F]=two_dimen(S,n1,n2)
% ��һά�������仯Ϊn1*n2�Ķ�ά����
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