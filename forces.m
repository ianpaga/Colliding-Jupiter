function [g,rho,P] = forces(Y,N)

global dim;
%%
gamma = 1.4;         

v = Y(1:dim,:);
mass = Y(end,:);
P = Y(dim+1,:);
rho = Y(end-2,:);

[W_array,dWdx_array,dvdt, niac,pair_i,pair_j] = NN_pairs(Y,N);

%rho = density(Y,W_array,N,niac,pair_j,pair_i);
%Y(end-2,:) = rho;

dedt = zeros(1,N);
drhodt = zeros(1,N);
dpdt = zeros(1,N);
dHdt= zeros(1,N);
dmdt= zeros(1,N);

%%
for k=1:niac
    
    i = pair_i(k);
    j = pair_j(k);
    vscty = visco(i,j,Y,gamma);
    
    A = (P(i)./(rho(i)^2) + P(j)./(rho(j)^2)) + vscty;     
    
    dvdt(:,i) = dvdt(:,i) - mass(j)*A*dWdx_array(:,k);
    dvdt(:,j) = dvdt(:,j) + mass(i)*A*dWdx_array(:,k); 
     
    dedt(i) = dedt(i) + 0.5*mass(j)*A*dot((v(:,i)-v(:,j)),dWdx_array(:,k));   
    dedt(j) = dedt(j) + 0.5*mass(i)*A*dot((v(:,i)-v(:,j)),dWdx_array(:,k));  
    
    drhodt(i) = drhodt(i) + mass(j)*dot((v(:,i)-v(:,j)),dWdx_array(:,k));   
    drhodt(j) = drhodt(j) + mass(i)*dot((v(:,i)-v(:,j)),dWdx_array(:,k)); 
    
end

dxdt = v;

g = [dvdt;dpdt;dxdt;dedt;drhodt;dHdt;dmdt];

end