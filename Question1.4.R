sigma_carre = 0;
M_empty = 42600;
M_pload = M_empty + 19900;
g = 9.8;
Ra = 3000;



# Simulation des bruits gaussiens et calcul des variables bruitées
# Pas besoin de re-simuler V, F, SFC

epsilon = rnorm(N);
V_sigma = V + sqrt(sigma_carre)*epsilon;

eta = rnorm(N);
F_sigma = F + sqrt(sigma_carre)*eta;

theta = rnorm(N);
SFC_sigma = SFC + sqrt(sigma_carre)*theta;



# Calcul de M avec les variables bruitées
# Lorsqu'on augmente sigma_carre, la distribution devient de plus en plus gaussienne

M = (M_empty + M_pload)*(exp((SFC_sigma*g*Ra*10^-3)/(V_sigma*F_sigma)) - 1);

hist(M, freq = FALSE, nclass = 200);
