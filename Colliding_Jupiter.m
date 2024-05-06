format long

global dim;
dim = 3;

N = 602;

NT= 10000;
dt = 5;


gamma = 1.4;
etha = 1.3;

 load Planet300.dat;

%%

t = zeros(NT,1); 
%H = zeros(1,N);  


X1 = [-7.5e7 + Planet300(:,1)';5.5e7 + Planet300(:,2)';Planet300(:,3)'];
V1 = [1e3 + Planet300(:,4)'; Planet300(:,5)';Planet300(:,6)'];
mass1 = Planet300(:,7)';
rho1 = Planet300(:,8)';
P1 = Planet300(:,9)';

X2 = [7.5e7 + Planet300(:,1)'; Planet300(:,2)';Planet300(:,3)'];
V2 = [-1e3 + Planet300(:,4)';Planet300(:,5)';Planet300(:,6)'];
mass2 = Planet300(:,7)';
rho2 = Planet300(:,8)';
P2 = Planet300(:,9)';

X0 = [X1,X2];
V0 = [V1,V2];
mass = [mass1,mass2];
rho0 = [rho1,rho2];
P0 = [P1,P2];

H0 = 0.7e7*ones(1,N);

E0 = zeros(1,N);

Y = [V0;P0;X0;E0;rho0;H0;mass];
Y(end-3,:) = energy(Y,gamma);

%plot3(Y(5,:),Y(6,:),Y(7,:),'o')
clear X0 X1 X2  V0 V1 V2 mass mass1 mass2 rho0 rho1 rho2  P0 P1 P2 E0 H0;

%% 
Ytime = zeros(11,N,NT);
 
for n=1:NT
    
    disp(n);
    Y = runge_kutta(Y, N,dt);
    t(n+1) = t(n) + dt;
    Ytime(:,:,n) = Y;
     
    
end
