%David Bell - 2014 
%batchFocus.m
Start = 1;
End = 44; %Start/ End defined by filenames
stdc(Start:End) = 0;
sumc(Start:End) = 0;
avgc(Start:End) = 0;

for n = Start:End
    file = strcat(sprintf('%03d',n), '.jpg'); %generate filename
    [stdc(n), sumc(n), avgc(n)] = measureFocus(file); %Measure file "n"
end

%Display results as stair charts for comparison
figure(1);stairs(stdc);
figure(2);stairs(sumc);
figure(3);stairs(avgc);