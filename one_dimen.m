function[S]=one_dimen(F)
%������ⳡ���һά������
[a,b]=size(F);
S=zeros(a*b,1);
count1=1;
for i=1:a
    for j=1:b
        S(count1,1)=F(i,j);
        count1=count1+1;
        if count1>a*b
            break;
        end
    end
end