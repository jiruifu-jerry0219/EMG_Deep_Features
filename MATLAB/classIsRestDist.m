%% Betthauser - 2016 --  Determine if class is rest or not (~0.075ms per decision)
% INPUTS: trainMeans - training class means (numF x C)  
%         testsample - testing data (numF x 1)     
%         
% OUTPUT: [predictRest] - 1 if rest, 0 if not
function [predictRest] = classIsRestDist(trainMeans, testsample) 
    numClasses = size(trainMeans,2);

      %% Dist
    minD = 1e300; % init to impossibly high number                 
    for j = 1:numClasses
        D = norm(testsample-trainMeans(:,j)); 
        if D < minD
            minD = D;
            predictRest = j;
        end                
    end
    if predictRest ~= 1
        predictRest = 0;
    end
end