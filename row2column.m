function[C]=row2column(R)
%��һά���������һά������
[a,b]=size(R);
C=zeros(b,1);
count=0;
for i=1:b
    C(i,1)=R(1,i)
    if count>b
        break;
    end
end