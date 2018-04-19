X = rbind(V + sqrt(sigma_carre)*epsilon, F + sqrt(sigma_carre)*eta, SFC + sqrt(sigma_carre)*theta);
V_prime = (b - a)*runif(N) + a;
F_prime = (d - c)*rbeta(N, alpha, beta) + c;
SFC_prime = rexp(N, lambda) + e;
epsilon_prime = rnorm(N);
eta_prime = rnorm(N);
theta_prime = rnorm(N);
X_prime = rbind(V_prime + sqrt(sigma_carre)*epsilon_prime, F_prime + sqrt(sigma_carre)*eta_prime, SFC_prime + sqrt(sigma_carre)*theta_prime);

X_I_F = rbind(X_prime[1, ], X[2, ], X_prime[3, ]);
Y_F = (M_empty + M_pload)*(exp((X[3, ]*g*Ra*10^-3)/(X[1, ]*X[2, ])) - 1);
Y_I_F = (M_empty + M_pload)*(exp((X_I_F[3, ]*g*Ra*10^-3)/(X_I_F[1, ]*X_I_F[2, ])) - 1);
S_I_F = cov(Y_F, Y_I_F)/var(Y_F);

X_I_SFC = rbind(X_prime[1, ], X_prime[2, ], X[3, ]);
Y_SFC = Y_F;
Y_I_SFC = (M_empty + M_pload)*(exp((X_I_SFC[3, ]*g*Ra*10^-3)/(X_I_SFC[1, ]*X_I_SFC[2, ])) - 1);
S_I_SFC = cov(Y_SFC, Y_I_SFC)/var(Y_SFC);

L3_sigma_carre = 10*(1:N)/N;
S_I_F = 1:N;
S_I_SFC = 1:N;
for (i in S_I_F)
{
  sigma_carre = L3_sigma_carre[i];
  
  X = rbind(V + sqrt(sigma_carre)*epsilon, F + sqrt(sigma_carre)*eta, SFC + sqrt(sigma_carre)*theta);
  X_prime = rbind(V_prime + sqrt(sigma_carre)*epsilon_prime, F_prime + sqrt(sigma_carre)*eta_prime, SFC_prime + sqrt(sigma_carre)*theta_prime);
  
  X_I_F = rbind(X_prime[1, ], X[2, ], X_prime[3, ]);
  Y_F = (M_empty + M_pload)*(exp((X[3, ]*g*Ra*10^-3)/(X[1, ]*X[2, ])) - 1);
  Y_I_F = (M_empty + M_pload)*(exp((X_I_F[3, ]*g*Ra*10^-3)/(X_I_F[1, ]*X_I_F[2, ])) - 1);
  S_I_F[i] = cov(Y_F, Y_I_F)/var(Y_F);
  
  X_I_SFC = rbind(X_prime[1, ], X_prime[2, ], X[3, ]);
  Y_SFC = Y_F;
  Y_I_SFC = (M_empty + M_pload)*(exp((X_I_SFC[3, ]*g*Ra*10^-3)/(X_I_SFC[1, ]*X_I_SFC[2, ])) - 1);
  S_I_SFC[i] = cov(Y_SFC, Y_I_SFC)/var(Y_SFC);
}
plot(L3_sigma_carre, S_I_F, type = "l");
plot(L3_sigma_carre, S_I_SFC, type = "l");
