function [W,dWdx,nabla] = Kernel(dx,h)

global dim; 

alpha_1 = [1/h, 15/(7*pi*h*h), 3/(2*pi*(h*h*h))];             

    r =norm(dx);
    R = r/h;
    
    if (R >= 0) && (R < 1) 
    W = alpha_1(dim)*(2/3 - (R*R) + 0.5*(R*R*R));
    dWdx = alpha_1(dim)*(-2 + 1.5*R)*(dx./(h*h));
    nabla = (1/(h*h))*(4/3*R - 1.2*(R*R*R) + 0.5*(R*R*R*R));
    
    elseif (R >= 1) && (R <= 2)
    W = alpha_1(dim)*1/6*(2-R)^3;
    dWdx = -alpha_1(dim)*0.5*(2-R)*(2-R)*(dx./(h*r)); 
    nabla = (1/(h*h))*( 8/3*R - 3*(R*R) + 1.2*(R*R*R) - 1/6*(R*R*R*R) - 1/(15*(R*R)));
 
    end

end