V_sigma_m = V_sigma[1:N/2]
SFC_sigma_m = SFC_sigma[1:N/2]
F_sigma_m = F_sigma[1:N/2]
M_m = (M_empty + M_pload)*(exp((SFC_sigma_m*g*Ra*10^-3)/(V_sigma_m*F_sigma_m)) - 1);

X_m = cbind(1, V_sigma_m, F_sigma_m, SFC_sigma_m)
X_prime_m = t(X_m)

b_m = solve(X_prime_m %*% X_m) %*% (X_prime_m %*% M_m)
b_m

V_sigma_M = V_sigma[501:N]
SFC_sigma_M = SFC_sigma[501:N]
F_sigma_M = F_sigma[501:N]
M_M = (M_empty + M_pload)*(exp((SFC_sigma_M*g*Ra*10^-3)/(V_sigma_M*F_sigma_M)) - 1);
X_M = cbind(1, V_sigma_M, F_sigma_M, SFC_sigma_M)
X_prime_M = t(X_M)

b_M = solve(X_prime_M %*% X_M) %*% (X_prime_M %*% M_M)
b_M

