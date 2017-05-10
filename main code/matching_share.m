percent_match = [];

fileNames=CreateDatabase();
fileNamesRot=CreateShareDatabase();
len=length(fileNamesRot);
for i=1:length(fileNames)
    disp(i);
    template1=load(char(fileNames(i)));
   for j=1:length(fileNames)
      template2=load(char(fileNamesRot(j)));
      num = match_end(template1,template2,10,0);
      percent_match(i,j) = num;
      disp(strcat(num2str(i),num2str(j)));
   end;
end;
%%
threshold=1:100;
count_far=zeros(1,length(threshold));
count_frr=zeros(1,length(threshold));
for k=1:length(threshold)
    for i=1:length(percent_match)
        for j=1:length(percent_match)
            if(percent_match(i,j)>threshold(k))
                count_far(k)=count_far(k)+1;
            end;
        end;
        if(percent_match(i,i)<threshold(k))
            count_frr(k)=count_frr(k)+1;
        end;
    end;
end;

%%
fname_f = sprintf('matching_500_r_s2.dat');
save(fname_f,'percent_match','-ASCII');

%%
subplot(3,2,1)
plot(threshold,count_far/(len*len));
title('FAR');
xlabel('Threshold');
ylabel('False acceptance rate');

subplot(3,2,2)
plot(threshold,count_frr/(len));
title('FRR');
xlabel('Threshold');
ylabel('False rejection rate');

subplot(3,2,3)
plot(threshold,count_far/(len*len),threshold,count_frr/(len));
title('FAR vs FRR');
xlabel('Threshold');
ylabel('FAR & FRR');

subplot(3,2,4)
plot(count_frr/(len),count_far/(len*len));
title('ROC');
xlabel('FRR');
ylabel('FAR');

