mu = 0;
sigma1 = 0.5;
sigma2=2;
sigma3=4;
x1 = -4*sigma1:1e-1:4*sigma1; 
x2 = -4*sigma2:1e-1:4*sigma2; 
x3 = -4*sigma3:1e-1:4*sigma3; 

y1 = normpdf(x1, mu, sigma1);
y2 = normpdf(x2, mu, sigma2);
y3 = normpdf(x3, mu, sigma3);

%pred niche width x1-x1 (mean trait value 30)
minx1 = min(x1);maxx1 = max(x1);gamma = 2;
for i = 1:length(x1);
    if x1(1,i) >= minx1 && x1(1,i) <= maxx1;
       IS1(i,1) = e^gamma*(x1(1,i) - 30)^2;
    end
end
TISx1 = sum(IS1)/(length(x1)*length(x1));

%pred niche width x1-x2 (mean trait value 30)
minx1 = min(x1);maxx1 = max(x1);gamma = 2;
for i = 1:length(x2);
    if x2(1,i) >= minx1 && x2(1,i) <= maxx1;
       IS2(i,1) = e^gamma*(x2(1,i) - 30)^2;
    end
end
TISx2 = sum(IS2)/(length(x1)*length(x1));

%pred niche width x1-x3 (mean trait value 30)
minx1 = min(x1);maxx1 = max(x1);gamma = 2;
for i = 1:length(x3);
    if x3(1,i) >= minx1 && x3(1,i) <= maxx1;
       IS3(i,1) = e^gamma*(x3(1,i) - 30)^2;
    end
end
TISx3 = sum(IS3)/(length(x1)*length(x1));

plot(var(x1), TISx1, 'b')
hold on 
plot(var(x2), TISx2, 'r')
hold on
plot(var(x3), TISx3, 'g')

%legend('mu=0, sigma=1', 'mu=0, sigma=2')
%title('Trait distributions')
xlabel('Variance')
%ylabel('Interaction strength')

