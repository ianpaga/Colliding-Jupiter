function [P] = pressure(Y,gamma)

E = Y(end-3,:);
rho = Y(end-2,:);

P = (gamma-1)*rho.*E;

end

