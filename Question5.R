L_sigma_carre = 0.001*(1:N)/N;
Esp_M = 1:N;
Var_M = 1:N;
for (i in Esp_M)
{
  sigma_carre = L_sigma_carre[i];
  V_sigma = V + sqrt(sigma_carre)*epsilon;
  F_sigma = F + sqrt(sigma_carre)*eta;
  SFC_sigma = SFC + sqrt(sigma_carre)*theta;
  M = (M_empty + M_pload)*(exp((SFC_sigma*g*Ra*10^-3)/(V_sigma*F_sigma)) - 1);
  Esp_M[i] = mean(M);
  Var_M[i] = var(M);
}

plot(L_sigma_carre, Esp_M, type = "l");
plot(L_sigma_carre, Var_M, type = "l");
