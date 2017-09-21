function [val] = transform_chi_square(x)
    val = 1/(1.001*(x^6)+0.999); %weighting function so that a chi-square of 0 gives weight 1 while chisquare of 1 gives weight 0.5 and then drops steeply for larger values
end