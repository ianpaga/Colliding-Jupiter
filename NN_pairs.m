function [W_array,dWdx_array,dvdt, niac,pair_i,pair_j] = NN_pairs(Y,N)

global dim;

G = 6.6740831e-11; 
kappa = 2;
niac=0; 

X = Y(dim+2:2*dim+1, :);
H = Y(end-1,:);
mass = Y(end,:);
dvdt = zeros(dim,N);

for i=1:N-1
   for j=i+1:N
       h = 0.5*(H(i)+ H(j));
       dx = X(:,i)-X(:,j);
       r = norm(dx);
       
       if norm(dx) <= kappa*h
          niac = niac + 1;
          pair_i(niac) = i;
          pair_j(niac) = j;
          
          [W,dWdx,nabla] = Kernel(dx,h);
          W_array(niac) = W;
          dWdx_array(:,niac) = dWdx; 
       else
          nabla = 1/(r*r);
       end
       
       dvdt(:,i) = dvdt(:,i) - G*mass(j)*nabla*(dx/r);         
       dvdt(:,j) = dvdt(:,j) + G*mass(i)*nabla*(dx/r);
       
   end
end


end