N = 1000
epsilon = rnorm(N);
V_sigma = V + sqrt(sigma_carre)*epsilon;
eta = rnorm(N);
F_sigma = F + sqrt(sigma_carre)*eta;
theta = rnorm(N);
SFC_sigma = SFC + sqrt(sigma_carre)*theta;
M = (M_empty + M_pload)*(exp((SFC_sigma*g*Ra*10^-3)/(V_sigma*F_sigma)) - 1);

X = cbind(1, V_sigma, F_sigma, SFC_sigma)
X_prime = t(X)

b = solve(X_prime %*% X) %*% (X_prime %*% M)
b


