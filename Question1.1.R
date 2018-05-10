N = 1000;



# Simulation et estimations pour V (loi uniforme entre 226 et 234)

a = 226;
b = 234;

V = (b - a)*runif(N) + a;

Esp_Th_V = (a + b)/2;
Var_Th_V = ((b - a)^2)/12;

Esp_Emp_V = (1/N)*sum(V^1);
Var_Emp_V = (1/N)*sum((V - Esp_Emp_V)^2);

hist(V, freq = FALSE, nclass = 200);



# Simulation et estimations pour F (loi beta entre 18.7 et 19.05)

c = 18.7;
d = 19.05;
alpha = 7;
beta = 2;

F = (d - c)*rbeta(N, alpha, beta) + c;

Esp_Th_F = (d - c)*(alpha/(alpha + beta)) + c;
Var_Th_F = ((d - c)^2)*((alpha*beta)/((alpha + beta + 1)*(alpha + beta)^2));

Esp_Emp_F = (1/N)*sum(F^1);
Var_Emp_F = (1/N)*sum((F - Esp_Emp_F)^2);

hist(F, freq = FALSE, nclass = 200);



# Simulation et estimations pour SFC (loi exponentielle à partir de 17.23)

lambda = 3.45;
e = 17.23;

SFC = rexp(N, lambda) + e;

Esp_Th_SFC = 1/lambda + e;
Var_Th_SFC = 1/lambda^2;

Esp_Emp_SFC = (1/N)*sum(SFC^1);
Var_Emp_SFC = (1/N)*sum((SFC - Esp_Emp_SFC)^2);

hist(SFC, freq = FALSE, nclass = 200);
