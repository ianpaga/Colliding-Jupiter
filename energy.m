function [E] = energy(Y,gamma)

global dim;

P = Y(dim+1,:);
rho = Y(end-2,:);

E = P./((gamma-1)*rho);

end

