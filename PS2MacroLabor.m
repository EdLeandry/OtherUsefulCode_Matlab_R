%% Problem 1
%b
clear
mu = 1;
sigma = 0.2;
a = 0.4;
b = 0.3;
r = 0.004;
params = [mu, sigma];

wageRes = fsolve(@(wr) (b - wr + (a./r).*(func_int1(wr, params))),1);
jfr = a * (1 - normcdf(wageRes, mu, sigma));
avgAccWage = integral(@(w) ((w.*normpdf(w,mu,sigma))./(1-normcdf(wageRes,mu,sigma))), wageRes, 1000);

%c
a1 = 0.2;

wageRes1 = fsolve(@(wr) (b - wr + (a1./r).*(func_int1(wr, params))),1);
jfr1 = a1 * (1 - normcdf(wageRes1, mu, sigma));
avgAccWage1 = integral(@(w) ((w.*normpdf(w,mu,sigma))./(1-normcdf(wageRes1,mu,sigma))), wageRes1, 1000);

sigma1 = 0.4;
params = [mu, sigma1];

wageRes2 = fsolve(@(wr) (b - wr + (a./r).*(func_int1(wr, params))),1);
jfr2 = a * (1 - normcdf(wageRes2, mu, sigma1));
avgAccWage2 = integral(@(w) ((w.*normpdf(w,mu,sigma1))./(1-normcdf(wageRes2,mu,sigma1))), wageRes2, 1000);

b1 = 0.5;
params=[mu, sigma];
wageRes3 = fsolve(@(wr) (b1 - wr + (a./r).*(func_int1(wr, params))),1);
jfr3 = a * (1 - normcdf(wageRes3, mu, sigma));
avgAccWage3 = integral(@(w) ((w.*normpdf(w,mu,sigma))./(1-normcdf(wageRes3,mu,sigma))), wageRes3, 1000);


%% Problem 2
%b
clear
mu = 1;
sigma = 0.2;
lambda = 0.1;
a = 0.4;
b = 0.3;
r = 0.004;
params = [mu, sigma];

wageRes = fsolve(@(wr) (b - wr + ((a-lambda)./(r+ lambda)).*(func_int1(wr, params))),1);
sepRate = lambda.*normcdf(wageRes,mu,sigma);

%c

b1 = 0.5;

wageRes1 = fsolve(@(wr) (b1 - wr + ((a-lambda)./(r+ lambda)).*(func_int1(wr, params))),1);
sepRate1 = lambda.*normcdf(wageRes1,mu,sigma);
