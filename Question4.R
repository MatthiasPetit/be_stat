sigma_carre = 0;
M_empty = 42600;
M_pload = M_empty + 19900;
g = 9.8;
Ra = 3000;

epsilon = rnorm(N);
V_sigma = V + sqrt(sigma_carre)*epsilon;
eta = rnorm(N);
F_sigma = F + sqrt(sigma_carre)*eta;
theta = rnorm(N);
SFC_sigma = SFC + sqrt(sigma_carre)*theta;

M = (M_empty + M_pload)*(exp((SFC_sigma*g*Ra*10^-3)/(V_sigma*F_sigma)) - 1);
hist(M, freq=FALSE, nclass = 200);
