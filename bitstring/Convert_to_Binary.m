function [binary len] = Convert_to_Binary(float)
    sample = float*10000;
    binary = dec2bin(sample);
    
    %binary of 10 is largest number assumed which is 17 characters long
    len = length(binary);
    for i=1:(17-len)
        binary = strcat(num2str(0),binary);
    end %i loop
end


