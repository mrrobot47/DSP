percent_match = [];

fileNames=CreateDatabase();
len = length(fileNames);
for i=1:length(fileNames)    
    template1=load(char(fileNames(i)));
   for j=1:length(fileNames)
      template2=load(char(fileNames(j)));
      num = match_end(template1,template2,10,0);
      percent_match(i,j) = num;
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
fname_f = sprintf('matching_60_nr.dat');
save(fname_f,'percent_match','-ASCII');

%%
subplot(3,2,1)
plot(threshold,count_far/(len*len));
title('FAR');
xlabel('Threshold');
ylabel('False acceptance rate');

subplot(3,2,2)
plot(threshold,count_frr/(len*len));
title('FRR');
xlabel('Threshold');
ylabel('False rejection rate');

subplot(3,1,2)
plot(count_frr/(len*len),count_far/(len*len));
title('ROC');
xlabel('FRR');
ylabel('FAR');
