function [a] = plot_regions(x1,x2,y,resolution)
step=resolution;
a=[];
for i=x1:step:x2
    a = [a;i,y];
end

end