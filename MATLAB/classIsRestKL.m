%% Betthauser - 2016 --  Determine if class is rest or not (~0.15ms per decision)
% INPUTS: trainMeansPDF - training class means in PDF form (numF x C)
%         testsample - testing data (numF x 1)     
%         
% OUTPUT: [predictRest] - 1 if rest, 0 if not
function [predictRest] = classIsRestKL(trainMeansPDF, testsample) 
    numClasses = size(trainMeansPDF,2);
    
    testsample = testsample / sum(testsample);            

      %% KLD 
    minKL = 1e300; % init to impossibly high number                 
    for j = 1:numClasses
        KL = KL_divergence(testsample,trainMeansPDF(:,j)); 
        if KL < minKL
            minKL = KL;
            predictRest = j;
        end                
    end
    if predictRest ~= 1
        predictRest = 0;
    end
end