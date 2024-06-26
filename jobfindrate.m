function y = jobfindrate(ft, vt, Ht, deltat, vtm1, tau)

At = (1 - ft - deltat + (ft*deltat))^tau;

Bt = 0;
for i = (1:tau)
Bt = Bt + (1 - ft - deltat + (ft*deltat))^(i-1);
end

Ct = 0;
for i = (1:tau)
    Ct = Ct + (tau-i)*(1 - ft - deltat + (ft*deltat))^(i-1);
end
 
y = Ht - (ft.* vtm1.* Bt) - (ft.*((vt - (At.*vtm1))./Bt).*Ct); 