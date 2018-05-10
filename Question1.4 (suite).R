# Espérance de M en fonction de sigma_carre entre 0 et 1, puis entre 0 et 0.01
# L'espérance peut parfois diminuer (pour les petites valeurs de sigma_carre) avant d'augmenter

L1_sigma_carre = (1:N)/N;
# L1_sigma_carre = 0.01*(1:N)/N;

L_Esp_M = 1:N;
for (i in 1:N)
{
  sigma_carre = L1_sigma_carre[i];
  
  V_sigma = V + sqrt(sigma_carre)*epsilon;
  F_sigma = F + sqrt(sigma_carre)*eta;
  SFC_sigma = SFC + sqrt(sigma_carre)*theta;
  
  M = (M_empty + M_pload)*(exp((SFC_sigma*g*Ra*10^-3)/(V_sigma*F_sigma)) - 1);
  
  L_Esp_M[i] = (1/N)*sum(M^1);
}

plot(L1_sigma_carre, L_Esp_M, type = "l");



# Variance de M en fonction de sigma_carre entre 0 et 0.1, puis entre 0 et 0.001
# La variance peut parfois diminuer (pour les petites valeurs de sigma_carre) avant d'augmenter

L2_sigma_carre = 0.1*(1:N)/N;
# L2_sigma_carre = 0.001*(1:N)/N;

L_Var_M = 1:N;
for (i in 1:N)
{
  sigma_carre = L2_sigma_carre[i];
  
  V_sigma = V + sqrt(sigma_carre)*epsilon;
  F_sigma = F + sqrt(sigma_carre)*eta;
  SFC_sigma = SFC + sqrt(sigma_carre)*theta;
  
  M = (M_empty + M_pload)*(exp((SFC_sigma*g*Ra*10^-3)/(V_sigma*F_sigma)) - 1);
  
  L_Var_M[i] = (1/N)*sum((M - (1/N)*sum(M^1))^2);
}

plot(L2_sigma_carre, L_Var_M, type = "l");
