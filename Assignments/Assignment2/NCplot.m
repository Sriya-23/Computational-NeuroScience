% getting arrays for V and W nullclines

function out = NCplot(I, b, r)


a = 0.5;


vnc = -0.5:0.000001:1.5;
Wv = zeros(length(vnc), 1); % v nullcline
Ww = zeros(length(vnc), 1); % w nullcline
out = zeros(length(vnc), 3);

% b = 0.1; r = 0.1;
for i = 1:length(vnc)
    
    fv = vnc(i)*(a - vnc(i))*(vnc(i) - 1);
    
    Wv(i) = (fv + I); % v nullcline
    Ww(i) = (b/r) * vnc(i); % w nullcline
    
   
    
end

 out(:,1)=vnc; out(:,2) = Wv; out(: ,3) = Ww;
 

end 