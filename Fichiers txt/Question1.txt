N = 1000;

a = 226;
b = 234;
V1 = runif(N);
V = (b - a)*V1 + a;
Esp_Emp_V = (1/N)*sum(V^1);
Var_Emp_V = (1/N)*sum((V-Esp_Emp_V)^2);
hist(V, freq=FALSE, nclass = 200);

c = 18.7;
d = 19.05;
alpha = 7;
beta = 2;
F1 = rbeta(N, alpha, beta);
F = (d - c)*F1 + c;
Esp_Emp_F = (1/N)*sum(F^1);
Var_Emp_F = (1/N)*sum((F-Esp_Emp_F)^2);
hist(F, freq=FALSE, nclass = 200);

lambda = 3.45;
x = 17.23;
SFC1 = rexp(N, lambda);
SFC = SFC1 + x;
Esp_Emp_SFC = (1/N)*sum(SFC^1);
Var_Emp_SFC = (1/N)*sum((SFC-Esp_Emp_SFC)^2);
hist(SFC, freq=FALSE, nclass = 200);
