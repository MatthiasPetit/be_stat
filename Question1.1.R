N = 1000;

a = 226;
b = 234;
V = (b - a)*runif(N) + a;
Esp_Emp_V = (1/N)*sum(V^1);
Var_Emp_V = (1/N)*sum((V - Esp_Emp_V)^2);
hist(V, freq=FALSE, nclass = 200);

c = 18.7;
d = 19.05;
alpha = 7;
beta = 2;
F = (d - c)*rbeta(N, alpha, beta) + c;
Esp_Emp_F = (1/N)*sum(F^1);
Var_Emp_F = (1/N)*sum((F - Esp_Emp_F)^2);
hist(F, freq=FALSE, nclass = 200);

lambda = 3.45;
e = 17.23;
SFC = rexp(N, lambda) + e;
Esp_Emp_SFC = (1/N)*sum(SFC^1);
Var_Emp_SFC = (1/N)*sum((SFC - Esp_Emp_SFC)^2);
hist(SFC, freq=FALSE, nclass = 200);
