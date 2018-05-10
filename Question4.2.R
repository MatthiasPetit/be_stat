sigma_carre = 0.01;



# Calcul du N-échantillon avec sigma_carre = 0.01
# Pas besoin de re-simuler V, F, SFC, epsilon, eta, theta

V_sigma = V + sqrt(sigma_carre)*epsilon;
F_sigma = F + sqrt(sigma_carre)*eta;
SFC_sigma = SFC + sqrt(sigma_carre)*theta;

M = (M_empty + M_pload)*(exp((SFC_sigma*g*Ra*10^-3)/(V_sigma*F_sigma)) - 1);

Z = cbind(1, V_sigma, F_sigma, SFC_sigma);
Z1 = cbind(1, V_sigma[1:(N/2)], F_sigma[1:(N/2)], SFC_sigma[1:(N/2)]);
Z2 = cbind(1, V_sigma[((N/2) + 1):N], F_sigma[((N/2) + 1):N], SFC_sigma[((N/2) + 1):N]);



# Estimation des coefficients a_i et calcul de l'expression linéaire de M sans terme d'erreur

A = solve(t(Z1) %*% Z1) %*% t(Z1) %*% M[1:(N/2)];

M_chapeau = Z %*% A;



# Estimation de la variance sigma_u_carre et simulation du terme d'erreur gaussien u

sigma_u_carre = sum((M[((N/2) + 1):N] - M_chapeau[((N/2) + 1):N])^2)/((N/2) - 4);

u = sqrt(sigma_u_carre)*rnorm(N);



# Calcul de l'expression linéaire de M avec terme d'erreur

M_lin = M_chapeau + u;

hist(M_lin, freq = FALSE, nclass = 200);
hist(M, freq = FALSE, nclass = 200);
