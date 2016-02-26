function sim = logKernel(x1, x2)

x1 = x1(:); x2 = x2(:);

sim = -log(((x1-x2)'*(x1-x2))^0.5+1);


end