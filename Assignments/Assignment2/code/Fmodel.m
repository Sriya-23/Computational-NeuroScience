function out = Fmodel(I, V0, W0, niter, b,r )
% Eulers forward integration method to solve the differential equations
t = 0;
delt = 0.01;
% niter = 10000;
out = zeros(niter, 3); 
 
a = 0.5;
v = zeros(niter, 1);
w = zeros(niter, 1);v(1) = V0; w(1) = W0;

% b = 0.1; r = 0.1;
for i = 2:niter
    out(i, 1) = t;
    t = t + delt;
    
    fv =v(i-1)*(a - v(i-1))*(v(i-1) - 1);
    
    v(i) = v(i-1) + delt*(fv - w(i-1) + I);
    w(i) = w(i-1) + delt*(b*v(i-1) - r * w(i-1));
    
end

 out(:,2) = v; out(: ,3) = w;
 
 


end