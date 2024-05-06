function [nablai,nablaj] = gravity(Y,i,j)
global dim;

X = Y(dim+2:2*dim+1, :);
H = Y(end-1,:);

hi = H(i);
hj = H(j);
dx = X(:,i)-X(:,j);
       
r =norm(dx);
Ri = r/hi;
Rj = r/hj;
       
if (Ri >= 0) && (Ri < 1) 
    nablai = (1/(hi^2))*(4/3*Ri - 6/5*Ri^3 + 0.5*Ri^4);
elseif (Ri >= 1) && (Ri < 2)
    nablai = (1/(hi^2))*( 8/3*Ri - 3*Ri^2 + 6/5*Ri^3 - 1/6*Ri^4 - 1/(15*Ri^2));
else
    nablai = 1/(r^2);            
end

if (Rj >= 0) && (Rj < 1) 
    nablaj = (1/(hj^2))*(4/3*Rj - 6/5*Rj^3 + 0.5*Rj^4);
elseif (Rj >= 1) && (Rj < 2)
    nablaj = (1/(hj^2))*( 8/3*Rj - 3*Rj^2 + 6/5*Rj^3 - 1/6*Rj^4 - 1/(15*Rj^2));
else
    nablaj = 1/(r^2);            
end

       
       
end

