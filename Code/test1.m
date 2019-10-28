x = 0.01:1e-1:40;  
for i = 1:length(x);
    ISmat(i,1) = e^(x(1,i) - 10);
    ISmis(i,1) = log(x(1,i) - 10);
    IS(i,1) = x(1,i); 
   ISeq = x; 
end

hold on
plot(IS,ISeq,'k')
hold on
plot(IS,ISmis,'b')
hold on
plot(IS,ISmat,'r')
axis([-10 10 -10 10])
%plot(IS(:,2),ISmat(:,1),'r')
%hold on
%plot(IS(:,2),ISmis(:,1),'g')

%xlabel('Matching','fontsize',14)
%ylabel('Contribution IS','fontsize',14)
%set(gca,'fontsize',14);
