clear
for i = 1:2
M = dlmread('1.txt'); %Use a better name that M
row = size(M, 1);
for n = 1:row
    if M(n, 10) == 1
end
end
