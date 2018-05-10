# Convergence en fonction de la taille de l'échantillon pour F (même principe que pour la 1.2)
# Lorsqu'on augmente sigma_carre, la convergence devient moins bonne

L_S_I_F_N = 1:N;
for (i in 1:N)
{
  X_I_F = rbind(X_prime[1, 1:i], X[2, 1:i], X_prime[3, 1:i]);
  
  Y_F = (M_empty + M_pload)*(exp((X[3, 1:i]*g*Ra*10^-3)/(X[1, 1:i]*X[2, 1:i])) - 1);
  Y_I_F = (M_empty + M_pload)*(exp((X_I_F[3, 1:i]*g*Ra*10^-3)/(X_I_F[1, 1:i]*X_I_F[2, 1:i])) - 1);
  
  L_S_I_F_N[i] = ((1/i)*sum(Y_F*Y_I_F)-((1/i)*sum(Y_F))*((1/i)*sum(Y_I_F)))/((1/i)*sum(Y_F^2)-((1/i)*sum(Y_F))^2);
}

L_S_I_F = 1:N;
for (i in 1:N)
{
  L_S_I_F[i] = S_I_F;
}

plot(L_S_I_F_N, type = "l");
lines(L_S_I_F, lty = 2, col = 2);



# Convergence en fonction de la taille de l'échantillon pour SFC (même principe que pour la 1.2)
# Lorsqu'on augmente sigma_carre, la convergence devient moins bonne

L_S_I_SFC_N = 1:N;
for (i in 1:N)
{
  X_I_SFC = rbind(X_prime[1, 1:i], X_prime[2, 1:i], X[3, 1:i]);
  
  Y_SFC = (M_empty + M_pload)*(exp((X[3, 1:i]*g*Ra*10^-3)/(X[1, 1:i]*X[2, 1:i])) - 1);
  Y_I_SFC = (M_empty + M_pload)*(exp((X_I_SFC[3, 1:i]*g*Ra*10^-3)/(X_I_SFC[1, 1:i]*X_I_SFC[2, 1:i])) - 1);
  
  L_S_I_SFC_N[i] = ((1/i)*sum(Y_SFC*Y_I_SFC)-((1/i)*sum(Y_SFC))*((1/i)*sum(Y_I_SFC)))/((1/i)*sum(Y_SFC^2)-((1/i)*sum(Y_SFC))^2);
}

L_S_I_SFC = 1:N;
for (i in 1:N)
{
  L_S_I_SFC[i] = S_I_SFC;
}

plot(L_S_I_SFC_N, type = "l");
lines(L_S_I_SFC, lty = 2, col = 2);
