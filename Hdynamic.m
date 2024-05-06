function H = Hdynamic(Y)

global dim;
etha = 1.35;
mass = Y(end,:);
rho = Y(end-2,:);

H = etha*(mass./rho).^(1/dim);

end

