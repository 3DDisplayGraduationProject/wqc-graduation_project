n=64;               %ͼƬ����ȡ������
K=K_gen(n);
r=real(K);
i=imag(K);
fid1=fopen('KR_orth.txt','w');
fid2=fopen('KI_orth.txt','w');

% for k1=1:28 
%     for k2=1:28
%         fprintf(fid1,'%4,4f',r(k1,k2));
%         fprintf(fid2,'%4,4f\t',i(k1,k2));
%     end
%     fprintf(fid1,'\n');
%     fprintf(fid2,'\n');
% end
% fclose(fid1);
% fclose(fid2);

for k1=1:n*n
        for k2=1:n*n
            fprintf(fid1,'%4.4f\t',r(k1,k2)); 
            fprintf(fid2,'%4.4f\t',i(k1,k2)); 
        end
        fprintf(fid1,'\n');
        fprintf(fid2,'\n');
end

%     
    
%     fid2=fopen(strcat(path6,'R',int2str(k),'.txt'),'w'); %��txt��ʽ�����������double�ͣ���ʵ��
%     for k1=1:28
%         for k2=1:28
%             fprintf(fid2,'%4.4f\t',r(k1,k2)); %���Ʊ����������
%         end
%         fprintf(fid2,'\n');
%     end
%     fclose(fid2);
%     
%     fid3=fopen(strcat(path7,'I',int2str(k),'.txt'),'w'); %��txt��ʽ�����������double�ͣ����鲿
%     for k1=1:28
%         for k2=1:28
%             fprintf(fid3,'%4.4f\t',i(k1,k2)); %���Ʊ����������
%         end
%         fprintf(fid3,'\n');
%     end
%     fclose(fid3);
    

    fclose(fid1);
    fclose(fid2);


% KR=textread('C:\Users\stacy\Documents\MATLAB\pre_pic_process\KR.txt','%f');
% KI=textread('C:\Users\stacy\Documents\MATLAB\pre_pic_process\KI.txt','%f');