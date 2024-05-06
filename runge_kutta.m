function Yn = runge_kutta(Y, N,dt)

global dim;
gamma = 1.4; 

%%

    %[~,rho,~] = forces(Y,N);
    P = pressure(Y,gamma);
    
    [a,~,~] = forces(Y,N);
    [b,~,~] = forces(Y+a*dt/2, N); 
    [c,~,~] = forces(Y+b*dt/2, N);
    [d,~,~] = forces(Y+c*dt, N);
    
    Yn = Y + (1/6)*dt*a + (1/3)*dt*b + (1/3)*dt*c + (1/6)*dt*d;
    
    %Yn(end-3,:) = rho;
    Yn(dim+1,:) = P;
    

end