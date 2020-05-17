function[uout]=MAXMINnormalize(uin)
MAX=max(max(uin));
MIN=min(min(uin));
[a,b]=size(uin);
uout=uin;
for k1=1:a
    for k2=1:b
        uout(k1,k2)=(uin(k1,k2)-MIN)/(MAX-MIN);
    end
end
end