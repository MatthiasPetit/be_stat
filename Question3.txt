K = 1000;

Esp_Th_V = (a + b)/2;
Var_Th_V = ((b - a)^2)/12;
L1 = 1:K;
for (i in L1)
{
  V1 = runif(N);
  V = (b - a)*V1 + a;
  Esp_Emp_V = (1/N)*sum(V^1);
  L1[i] = sqrt(N)*((Esp_Emp_V - Esp_Th_V)/sqrt(Var_Th_V));
}
hist(L1, freq=FALSE, nclass = 200);

Esp_Th_F = (d - c)*(alpha/(alpha + beta)) + c;
Var_Th_F = ((d - c)^2)*((alpha*beta)/((alpha + beta + 1)*(alpha + beta)^2));
L2 = 1:K;
for (i in L2)
{
  F1 = rbeta(N, alpha, beta);
  F = (d - c)*F1 + c;
  Esp_Emp_F = (1/N)*sum(F^1);
  L2[i] = sqrt(N)*((Esp_Emp_F - Esp_Th_F)/sqrt(Var_Th_F));
}
hist(L2, freq=FALSE, nclass = 200);

Esp_Th_SFC = 1/lambda + x;
Var_Th_SFC = 1/lambda^2;
L3 = 1:K
for (i in L3)
{
  SFC1 = rexp(N, lambda);
  SFC = SFC1 + x;
  Esp_Emp_SFC = (1/N)*sum(SFC^1);
  L3[i] = sqrt(N)*((Esp_Emp_SFC - Esp_Th_SFC)/sqrt(Var_Th_SFC));
}
hist(L3, freq=FALSE, nclass = 200);
