mu = 0;
sigma1 = 0.5;
sigma2=2;
sigma3=4;
x1 = -4*sigma1:1e-2:4*sigma1; 
x2 = -4*sigma2:1e-2:4*sigma2; 
x3 = -4*sigma3:1e-2:4*sigma3; 

y1 = normpdf(x1, mu, sigma1);
y2 = normpdf(x2, mu, sigma2);
y3 = normpdf(x3, mu, sigma3);

plot(x1, y1,'linewidth',2)
hold on 
plot(x2, y2, 'r','linewidth',2)
hold on
plot(x3, y3, 'g','linewidth',2)

%legend('mu=0, sigma=1', 'mu=0, sigma=2')
%title('Trait distributions')
set(gca,'fontsize',18);
xlabel('Trait','fontsize', 20)
ylabel('Density','fontsize', 20)
axis([-20 20 -0.01 1])
