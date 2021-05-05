
function [EMGobj] = getEMGfeaturesAllData(filtEMG, windowsize, stepsize)

    dataLength = size(filtEMG,2);
    fftLength = 256;
    ARdegree = 6;
    j = 0;  
    vec = windowsize:stepsize:dataLength;
    for i = vec
        j = j+1;
        sampleEMG = filtEMG(:,i-windowsize+1:i);
        EMGtemp = getEMGfeaturesTD(sampleEMG);
        EMGobj.MAV(:,j) = EMGtemp.MAV;
        EMGobj.TD(:,j) = [EMGtemp.MAV; EMGtemp.WL; EMGtemp.VAR; EMGtemp.SSC; EMGtemp.ZC]; 
     
    end
    

end