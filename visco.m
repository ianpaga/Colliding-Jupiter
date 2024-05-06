function vscty = visco(i,j,Y,gamma)
global dim;

v = Y(1:dim,:);
X = Y(dim+2:2*dim+1, :); 
rho = Y(end-2,:);
E = Y(end-3,:);
H = Y(end-1,:);

cij = 0.5*sqrt(gamma-1)*(  sqrt(E(:,i)) + sqrt(E(:,j)) );
rhoij = 0.5*(rho(:,i) + rho(:,j));
h = 0.5*(H(i) + H(j));

vij = v(:,i) - v(:,j);
Xij = X(:,i) - X(:,j);
phiij =  (h*dot(vij,Xij))/((norm(Xij))^2 + (0.1*h)^2);

if dot(vij,Xij) < 0
    vscty = (-cij*phiij + phiij^2)/(rhoij);
else
    vscty = 0;
end

end

