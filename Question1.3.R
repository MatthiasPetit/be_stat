K = 1000;



# TCL pour V

TCL_V = 1:K;
for (i in 1:K)
{
  V = (b - a)*runif(N) + a;
  Esp_Emp_V = (1/N)*sum(V^1);
  
  TCL_V[i] = sqrt(N)*((Esp_Emp_V - Esp_Th_V)/sqrt(Var_Th_V));
}

hist(TCL_V, freq = FALSE, nclass = 200);



# TCL pour F

TCL_F = 1:K;
for (i in 1:K)
{
  F = (d - c)*rbeta(N, alpha, beta) + c;
  Esp_Emp_F = (1/N)*sum(F^1);
  
  TCL_F[i] = sqrt(N)*((Esp_Emp_F - Esp_Th_F)/sqrt(Var_Th_F));
}

hist(TCL_F, freq = FALSE, nclass = 200);



# TCL pour SFC

TCL_SFC = 1:K;
for (i in 1:K)
{
  SFC = rexp(N, lambda) + e;
  Esp_Emp_SFC = (1/N)*sum(SFC^1);
  
  TCL_SFC[i] = sqrt(N)*((Esp_Emp_SFC - Esp_Th_SFC)/sqrt(Var_Th_SFC));
}

hist(TCL_SFC, freq = FALSE, nclass = 200);
