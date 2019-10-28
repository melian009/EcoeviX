%c	= 3,000, τ = 0	Original EW model
% 	 	Strong selection
% 	 	Absolute trait effect and fitness effect uncorrelated

%Adam Eyre-Walker PNAS (2010)
%Genetic architecture of a complex trait and its implications 
%for fitness and genome-wide association studies

%T.-L. North & M. A. Beaumont Scientific reports (2015)
%Complex trait architecture: the pleiotropic model revisited


Ne = 1000;
rho =1;
for i =1:10000;

    a = 2;
    b = 0;
    y = a.*randn(1,1) + b;%mean b and SD a

    s = unifrnd(0,100);
    
    S(i,1) = 4*Ne*s;
    r = unifrnd(0,1);
    if r > 0.50;
       lambda = 1;
    else
       lambda = -1;
    end
    z(i,1) = lambda*S(i,1)^(rho)*(1 + y);
end
subplot(2,2,1)
plot(S,z,'o')
title('rho = 0, SD = 3')
subplot(2,2,2)
hist(z)
