N = 602;
NT= 4000;
dt = 5;
t = zeros(NT,1);

load Ytime.mat % remove?

vidobj = VideoWriter('collision.avi');
vidobj.Quality = 100;
open(vidobj);

for n=1:NT
%for n=1:1600
    
    t(n+1) = t(n) + dt;
    disp(n)
    

%% Position, density, pressure, energy

    subplot(4,4,[1,2,5,6]);
    plot3(Ytime(5,1:301,n),Ytime(6,1:301,n),Ytime(7,1:301,n),'.b','MarkerSize',8);
    hold on
    plot3(Ytime(5,302:end,n),Ytime(6,302:end,n),Ytime(7,302:end,n),'.r','MarkerSize',8);
    hold off
    axis([-1.2e8 1.2e8 -1.2e8 1.2e8 -1.2e8 1.2e8]);
    axis equal
    title('3D Space')
    xlabel('x(m)'); 
    ylabel('y(m)');
    zlabel('z(m)');
    grid on
    
    subplot(4,4,[3,4,7,8]);
    plot(Ytime(5,1:301,n),Ytime(end-2,1:301,n),'.b','MarkerSize',8) 
    hold on
    plot(Ytime(5,302:end,n),Ytime(end-2,302:end,n),'.r','MarkerSize',8) 
    hold off
    axis([-1.3e8 1.3e8 0 1.3e5]);
    title('Density')
    xlabel('x(m)'); 
    ylabel('Density(Kg/m^3)');
    grid on
    
    subplot(4,4,[9,10,13,14]);
    plot(Ytime(5,1:301,n),Ytime(4,1:301,n),'.b','MarkerSize',8) 
    hold on
    plot(Ytime(5,302:end,n),Ytime(4,302:end,n),'.r','MarkerSize',8) 
    hold off
    axis([-1.3e8 1.3e8 0 3e14]);
    title('Pressure')
    xlabel('x(m)'); 
    ylabel('Pressure(N/m^2)');
    grid on
    
    subplot(4,4,[11,12,15,16]);
    plot(Ytime(5,1:301,n),Ytime(end-3,1:301,n),'.b','MarkerSize',8) 
    hold on
    plot(Ytime(5,302:end,n),Ytime(end-3,302:end,n),'.r','MarkerSize',8) 
    hold off
    axis([-1.3e8 1.3e8 0 1.3e10]);
    title('Internal energy')
    xlabel('x(m)'); 
    ylabel('Internal energy(J/Kg)');
    grid on

    %%
    
    currframe = getframe(gcf);
    writeVideo(vidobj,currframe);   
    
end

close(vidobj);
