function[C]=row2column(R)
%将一维行向量变成一维列向量
[a,b]=size(R);
C=zeros(b,1);
count=0;
for i=1:b
    C(i,1)=R(1,i)
    if count>b
        break;
    end
end