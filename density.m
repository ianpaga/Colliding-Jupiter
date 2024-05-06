function rho = density(Y,W_array,N,niac,pair_j,pair_i)

H = Y(end-1,:);
mass = Y(end,:);

rho = zeros(1,N);
for i=1:N
    [W0,~,~] = Kernel(0,H(i));
    rho(i) = mass(i)*W0;
end

 for k=1:niac
     i = pair_i(k);
     j = pair_j(k);
     
     rho(i) = rho(i) + mass(j)*W_array(k);
     rho(j) = rho(j) + mass(i)*W_array(k);
 
 end

end

