mu = 0;
sigma1 = 0.5;
sigma2=2;
sigma3=4;
x = -4*sigma2:1e-3:4*sigma2; 
y1 = normpdf(x, mu, sigma1);
y2 = normpdf(x, mu, sigma2);
y3 = normpdf(x, mu, sigma3);

plot(x, y1)
hold on 
plot(x, y2, 'r')
hold on
plot(x, y3, 'g')

%legend('mu=0, sigma=1', 'mu=0, sigma=2')
%title('Trait distributions')
xlabel('Trait')
ylabel('Density')
