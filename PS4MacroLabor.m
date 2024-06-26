%% Problem 1 part i)
clear;
u = [5500;5500;5500;5500;5500;5500;5500;5500;5500;5500];
v = (1000:1000:10000);
mu = 0.3;
h = zeros(10,1);
H = 0;

for i = (1:10)
    h(i)= mu .* ((u(i)).^0.5) .* ((v(i)).^0.5);
    H = H + h(i);
end

%% Problem 1 part ii)
clear;
u = [5500;5500;5500;5500;5500;5500;5500;5500;5500;5500];
v = (1000:1000:10000);
u_tot = 5500 * 10;
v_tot = sum(v);
u_opt = zeros(10, 1);
mu = 0.3;
H = 0;

for i = (1:10)
    u_opt(i) = (u_tot/v_tot) * v(i);  
end

for i = (1:10)
    h(i)= mu .* ((u_opt(i)).^0.5) .* ((v(i)).^0.5);
    H = H + h(i);
end

%% Problem 1 part iii)
clear;
u = [5500;5500;5500;5500;5500;5500;5500;5500;5500;5500];
v = (1000:1000:10000);
u_tot = 5500 * 10;
v_tot = sum(v);
u_opt = zeros(10, 1);
sum1 = 0;

for i = (1:10)
    opt = (v(i)/v_tot)^0.5 * (u(i)/u_tot)^0.5;
    sum1 = sum1 + opt;
end
M = 1 - sum1;








%% Problem 1 part iv.a)
clear;
u = [5500;5500;5500;5500;5500;5500;5500;5500;5500;5500];
v = (1000:1000:10000);
mu = 0.3;
h = zeros(10,1);
H = 0;

for i = (1:10)
    h(i)= mu .* v(i);
    H = H + h(i);
end

%% Problem 1 part iv.b)
clear;
u = [5500;5500;5500;5500;5500;5500;5500;5500;5500;5500];
v = (1000:1000:10000);
u_tot = 5500 * 10;
v_tot = sum(v);
u_opt = zeros(10, 1);
mu = 0.3;
H = 0;
sum1 = 0;

for i = (1:10)
    u_opt(i) = (u_tot/v_tot) * v(i);  
end

for i = (1:10)
    h(i)= mu .* v(i);
    H = H + h(i);
end

for i = (1:10)
    opt = (v(i)/v_tot)^0.5 * (u_opt(i)/u_tot)^0.5;
    sum1 = sum1 + opt;
end
M = 1 - sum1;

%% Problem 2 part b)
clear;
jolts = readtable("PS4MacroLaborRawData.xlsx");
vt = jolts(:, 3);
vt = table2array(vt);
vtm1 = zeros(265,1);
vtm1(1,1) = 1;
for i = (2:265)
    vtm1(i) = vt(i-1);
end

Ht = jolts(:, 4);
Ht = table2array(Ht);
tau = 26 + zeros(265,1);
deltat = 0.001 + zeros(265,1);
ft = zeros(265,1);


for i = (2:265)
sol = fzero( @(ft) jobfindrate(ft, vt(i), Ht(i), deltat(i), vtm1(i), tau(i)), 0);
ft(i) = sol;
end


plot(ft)




