mu = 0;
s = 5;
x1 = -3:1e-2:3;  
y1 = normpdf(x1, mu, s);
%Check Box-Muller transform to produce standard normal distributions

%subplot(2,2,1)
%hold on
%plot(x1,y1)
gamma = 2;
s = 1;
z = 5;
K = -1;
N0 = 0;
N1 = 0;

%norm loop
for i = 1:length(x1);
    %op 1
    %IS(i,2) = abs(x1(1,i) - z);%e 
    IS(i,1) = z - x1(1,i);%exp 

    %Max contribution IS inds closer to z inds
    %ISmis(i,1) = abs(e^gamma*(x1(1,i) - z));
    %ISmis(i,1) = e^gamma*(x1(1,i) - z);
    
    %ISmis(i,1) = (gamma/(s*sqrt(pi)))*(exp(-(z - x1(1,i))^2));
    N0 = N1;
    sign = x1(1,i) - mu;%Jorge
    if sign == 0;
       sign = 1;
    end
    if K == 0;
       N1 = N0 + exp(-(x1(1,i) - mu)^2);
    elseif K > 0;
       if sign > 0;
          N1 = N0 + exp(-(x1(1,i) - mu)^gamma) + 2*K*([1-exp(-(x1(1,i) - mu)^gamma)] + 1);
       elseif sign < 0;
          N1 = N0 + exp(-(x1(1,i) - mu)^gamma) + 2*K*(-[1-exp(-(x1(1,i) - mu)^gamma)] + 1);
       end
    elseif K < 0;
        if sign > 0;
           N1 = N0 + exp(-(x1(1,i) - mu)^gamma) + 2*K*([1-exp(-(x1(1,i) - mu)^gamma)] - 1);
        elseif sign < 0;
           N1 = N0 + exp(-(x1(1,i) - mu)^gamma) + 2*K* (-[1-exp(-(x1(1,i) - mu)^gamma)] - 1);
        end       
    end
end

N = N1/length(x1);

for i = 1:length(x1);
    %op 1
    %IS(i,2) = abs(x1(1,i) - z);%e 
    IS(i,1) = z - x1(1,i);%exp 

    %Max contribution IS inds closer to z inds
    %ISmis(i,1) = abs(e^gamma*(x1(1,i) - z));
    %ISmis(i,1) = e^gamma*(x1(1,i) - z);
    
    %ISmis(i,1) = (gamma/(s*sqrt(pi)))*(exp(-(z - x1(1,i))^2));
    
    sign = x1(1,i) - mu;%Jorge
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
plot(IS(:,1),ISmis(:,1),'b')
%hold on
%plot(IS(:,1),ISeq(:,1),'b')


xlabel('Trait distance','fontsize',28)
ylabel('Contribution IS','fontsize',28)
set(gca,'fontsize',28);



