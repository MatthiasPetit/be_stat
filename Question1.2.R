LFGN_V = cumsum(V)/(1:N);
plot(LFGN_V, type = "l");

LFGN_F = cumsum(F)/(1:N);
plot(LFGN_F, type = "l");

LFGN_SFC = cumsum(SFC)/(1:N);
plot(LFGN_SFC, type = "l");
