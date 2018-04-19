L1_sigma_carre = 0.1*(1:N)/N;
Esp_M = 1:N;
for (i in Esp_M)
{
  sigma_carre = L1_sigma_carre[i];
  V_sigma = V + sqrt(sigma_carre)*epsilon;
  F_sigma = F + sqrt(sigma_carre)*eta;
  SFC_sigma = SFC + sqrt(sigma_carre)*theta;
  M = (M_empty + M_pload)*(exp((SFC_sigma*g*Ra*10^-3)/(V_sigma*F_sigma)) - 1);
  Esp_M[i] = mean(M);
}
plot(L1_sigma_carre, Esp_M, type = "l");

L2_sigma_carre = 0.001*(1:N)/N;
Var_M = 1:N;
for (i in Var_M)
{
  sigma_carre = L2_sigma_carre[i];
  V_sigma = V + sqrt(sigma_carre)*epsilon;
  F_sigma = F + sqrt(sigma_carre)*eta;
  SFC_sigma = SFC + sqrt(sigma_carre)*theta;
  M = (M_empty + M_pload)*(exp((SFC_sigma*g*Ra*10^-3)/(V_sigma*F_sigma)) - 1);
  Var_M[i] = var(M);
}
plot(L2_sigma_carre, Var_M, type = "l");
