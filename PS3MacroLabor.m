%% Problem 2 part a
clear
lamda = 0.02;
mu = 0.3;
beta = 0.5;
theta = linspace(0,10,101);

n = length(theta);

u = zeros(n,1);

for i = (1:n)
    u(i) = lamda./(lamda + (theta(i).* (mu*(theta(i)^(1-beta)))));
end
plot(u, theta)
%% Problem 2 part b
lamda1 = 0.03;
u1 = zeros(n,1);

for i = (1:n)
    u1(i) = lamda1./(lamda1 + (theta(i).*(mu*(theta(i)^(1-beta)))));
end
hold on
plot(u, theta);
plot(u1, theta);
legend('BC with λ = 0.02 ', 'BC with λ = 0.03')
hold off



%% Problem 2 part c
mu1 = 0.2;
u2 = zeros(n,1);

for i = (1:n)
    u2(i) = lamda./(lamda + (theta(i).*(mu1*(theta(i)^(1-beta)))));
end

hold on
plot(u, theta);
plot(u2, theta);
legend('BC with µ = 0.3 ', 'BC with µ = 0.2')
hold off

