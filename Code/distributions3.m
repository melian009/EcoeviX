mu = 0;
count = 0;
for s = 0.1:0.5:20;
a =unifrnd(0,1);
b =unifrnd(0,1);
c =unifrnd(0,1);

x1 = -6*s:1e-2:6*s;  
y1 = normpdf(x1, mu, s);

%hold on
%subplot(2,2,1)
%hold on
%h1 = plot(x1,y1);
%set(h1,'color',[a b c]);

%subplot(2,2,2)
%hist(y1)
%pause

ISmis = zeros(length(x1),1);
ISmat = zeros(length(x1),1);
IScom = zeros(length(x1),1);
%minx1 = min(x1);maxx1 = max(x1);
minx1 = -75;maxx1 = 75;
gamma = 2;count2 = 0;
for i = 1:length(x1);
    if x1(1,i) >= minx1 && x1(1,i) <= maxx1;
       count2 = count2 + 1;
       ISmis(i,1) = abs(e^gamma*(x1(1,i) - 35));%mismatching (Freq. dep sele: max contrib IS more distant inds)
       %IS1(i,1) = abs(x1(1,i) - 75);
       ISmat(i,1) = abs(e^gamma*(min(x1) - 35)) - abs(e^gamma*(x1(1,i) - 35));%matching (Freq. dep sel: max contrib IS less distant inds)
       %ISmis(i,1) = abs(e^gamma*(x1(1,i) - 35));%mismatching (Freq. dep sele: max contrib IS more distant inds) 
       %ISmat(i,1) = abs(e^2*(min(x1) - 35)) - abs(e^2*(x1(1,i) - 35));
       IScom(i,1) = y1(1,i) * abs(e^2*(x1(1,i) - 35));
    end
end
ISmis1 = ISmis - min(ISmis);

count = count + 1;
TISmis(count,1) = sum(ISmis1)/(count2*count2);%mismatching
TISmat(count,1) = sum(ISmat)/(count2*count2);%matching
TIScom(count,1) = sum(IScom)/(count2*count2);%matching

Sig(count,1) = s;

%hold on
%subplot(2,2,2)
%hold on
%set(h1,'color',[a b c]);
%pause
end%s

%Equal pref.
TISeq(1:length(TISmis)) = mean(TISmis+TISmat+TIScom);

hold on
subplot(2,3,3)
semilogy(Sig,TISmis,"markersize", 2,'r');
hold on
semilogy(Sig,TISmat,"markersize", 2,'k');
hold on
semilogy(Sig,TISeq,"markersize", 2,'b');
hold on
semilogy(Sig,TIScom,"markersize", 2,'g');
axis([-1 20 0.01 1000])

%legend('mu=0, sigma=1', 'mu=0, sigma=2')
%title('Trait distributions')
xlabel('Variance','fontsize',14)
ylabel('Interaction strength','fontsize',14)
set(gca,'fontsize',14);
