clc
clear all

%for i=1:1000
%Global_result= [];
%fname = sprintf('RunChannel%d',i);
%if(fname)
data=load('~/Desktop/LaserAnalysis/Threshold_Fraction_Optimization/15334Ch1.txt');
%else
%    continue
%end




x=data(:,1);
y=data(:,2);
yerror=data(:,3);
yerror=yerror.^2; 
intervals=nchoosek(1:length(x),2);
acc=0;
for count=1:length(intervals(:,1))
    diff=intervals(count,2)-intervals(count,1);
    if(diff==4)
        acc=acc+1;
        accInter(acc,1)=intervals(count,1);
        accInter(acc,2)=intervals(count,2);
    end 
end    
msqes=zeros(size(accInter,1),1);
chisqndf=zeros(size(accInter,1),1);
c=zeros(size(accInter,1),1);
for i=1:length(msqes)
    start_i=accInter(i,1);
    end_i=accInter(i,2);
    y_i=y(start_i:end_i);
    yerror_i=yerror(start_i:end_i);
    c(i)=(sum(y_i./yerror_i)/sum(1./yerror_i));
    msqes(i)=sum(((y_i-c(i)).^2)./(yerror_i).^2);
    chisqndf(i)=msqes(i)/(length(y_i)-2);
end
[~,I2]=sort(abs(chisqndf));
size(I2)
result=[x(accInter(I2(1:6),1)) x(accInter(I2(1:6),2)) chisqndf(I2(1:6))];
disp('      x_1       x_2       red_chisq');
disp(result)


%Global_Result = [Global_Result;result];
%csvwrite('file.csv',Global_Result)