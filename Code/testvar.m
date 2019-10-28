mu = 0;
for s = 0.01:0.1:10;
x1 = -5:1e-2:5;  
y1 = normpdf(x1, mu, s);
%Check Box-Muller transform to produce standard normal distributions

%subplot(2,2,1)
%hold on
%plot(x1,y1)
%s = 1;
z = 5;
K = 1;
N0 = 0;
N1 = 0;
nw = 20;
%norm loop
for i = 1:length(x1);
    if abs(x1(1,i)) <= nw;
    IS(i,1) = z - x1(1,i);%exp 
    N0 = N1;
    sign = x1(1,i) - mu;%Jorge
    if sign == 0; 
       sign = 1;
    end
    if K == 0;
       N1 = N0 + exp(-(x1(1,i) - mu)^2);
    elseif K > 0;
       if sign > 0;
          N1 = N0 + exp(-(x1(1,i) - mu)^2) + 2*K*([1-exp(-(x1(1,i) - mu)^2)] + 1);
       elseif sign < 0;
          N1 = N0 + exp(-(x1(1,i) - mu)^2) + 2*K*(-[1-exp(-(x1(1,i) - mu)^2)] + 1);
       end
    elseif K < 0;
        if sign > 0;
           N1 = N0 + exp(-(x1(1,i) - mu)^2) + 2*K*([1-exp(-(x1(1,i) - mu)^2)] - 1);
        elseif sign < 0;
           N1 = N0 + exp(-(x1(1,i) - mu)^2) + 2*K* (-[1-exp(-(x1(1,i) - mu)^2)] - 1);
        end       
    end
    end%if niche width
end

N = N1/length(x1);

S0 = 0;
S1 = 0;

for i = 1:length(x1);
    if abs(x1(1,i)) <= nw;
    S0 = S1;
    sign = x1(1,i) - mu;
    if sign == 0;
       sign = 1;
    end
    if K == 0;
       ISmis(i,1)= (exp(-(x1(1,i) - mu)^2))/N;
    elseif K > 0;
       if sign > 0;
          ISmis(i,1)= (exp(-(x1(1,i) - mu)^2) + 2*K*([1-exp(-(x1(1,i) - mu)^2)] + 1))/N;
       elseif sign < 0;
          ISmis(i,1)= (exp(-(x1(1,i) - mu)^2) + 2*K*(-[1-exp(-(x1(1,i) - mu)^2)] + 1))/N;
       end
    elseif K < 0;
        if sign > 0;
        ISmis(i,1)= (exp(-(x1(1,i) - mu)^2) + 2*K*([1-exp(-(x1(1,i) - mu)^2)] - 1))/N;
        elseif sign < 0;
        ISmis(i,1)= (exp(-(x1(1,i) - mu)^2) + 2*K* (-[1-exp(-(x1(1,i) - mu)^2)] - 1))/N;
        end       
    end
    
    S1 = (S0 + ISmis(i,1)*y1(1,i));%/350;
    end
    %If abs(x1) < niche width == S1%symmetric prey dist
end

%ISmis1 = ISmis - min(ISmis);
%ISeq(1:length(ISmis)) = mean(ISmis1);%abs e
%ISeq(1:length(ISmis)) = mean(ISmis);%exp


%subplot(2,2,2)
%hold on
%plot(IS(:,1),IScom(:,1),'g')
%hold on
%plot(IS(:,1),ISmat(:,1),'k')
%hold on
%plot(IS(:,1),ISmis1(:,1),'r')%e
hold on
subplot(2,3,3)
plot(s,S1,'r')
end

title('d, broad','fontsize',14)
xlabel('Trait variance of prey','fontsize',14)
ylabel('Interaction strength','fontsize',14)
set(gca,'fontsize',14);



