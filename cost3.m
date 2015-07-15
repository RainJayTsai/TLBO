function c=cost3(par)
 c = sum(abs(par.*sin(par) + 0.1.*par),2);