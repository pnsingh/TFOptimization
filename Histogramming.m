%This function takes in the set of flat regions from each run, and then
%finds the maximal overlap which has the minimal length and whose
%chi_square is less than 2 essentially.


close all;figure;

resolution = 1e-4;%Higher will show better plots; going below 1e-4 takes too long; 

%Artifical Data
 ds = [];
 
 for i=0.2:0.05:0.3
     for j=i:100
         ds = [ds;i,i+0.2,rand];
     end
 end
 
 for i=0.6:0.05:0.7
     for j=1:100
         ds = [ds;i,i+0.2,rand];
     end
 end
%end Artifical Data
data = ds;%load('Global_Result'); %Load concatenated file from 1000 different runs of a given channel, containing 1000X5 lines of the form x_1,x_2,chi_squared



for i=1:length(data)
   a=plot_regions(data(i,1),data(i,2),data(i,3),resolution);
   hold on;plot(a(:,1),a(:,2),'g-');    
end

Global_Voting = zeros(floor(1/resolution),1);

step = resolution;
for i=1:size(data,1)
    for j=data(i,1):step:data(i,2)
        %if( (j>=0.55) && (j<=0.6))
           %fprintf(2,'%d,%d,%f,%f,%f,%f\n',i,j,data(i,1),data(i,2),data(i,3),transform_chi_square(data(i,3)));
        %end
        Global_Voting(floor(j/step))=Global_Voting(floor(j/step))+transform_chi_square(data(i,3));
    end
end



figure;
plot(Global_Voting/max(Global_Voting),'r-');
ylim([1e-1,inf])
%xlim([0,inf])

