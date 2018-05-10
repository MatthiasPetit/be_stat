# LFGN pour V

LFGN_V = cumsum(V)/(1:N);

L_Esp_V = 1:N;
for (i in 1:N)
{
  L_Esp_V[i] = Esp_Emp_V;
}

plot(LFGN_V, type = "l");
lines(L_Esp_V, lty = 2, col = 2);



# LFGN pour F

LFGN_F = cumsum(F)/(1:N);

L_Esp_F = 1:N;
for (i in 1:N)
{
  L_Esp_F[i] = Esp_Emp_F;
}

plot(LFGN_F, type = "l");
lines(L_Esp_F, lty = 2, col = 2);



#LFGN pour SFC

LFGN_SFC = cumsum(SFC)/(1:N);

L_Esp_SFC = 1:N;
for (i in 1:N)
{
  L_Esp_SFC[i] = Esp_Emp_SFC;
}

plot(LFGN_SFC, type = "l");
lines(L_Esp_SFC, lty = 2, col = 2);
