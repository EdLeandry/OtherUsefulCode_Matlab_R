function y = func_int1(wr, params)

mu = params(1);
sigma = params(2);

y = integral(@(w) ((w - wr).*normpdf(w, mu ,sigma)), wr, inf);

end