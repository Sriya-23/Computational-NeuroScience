% stability analysis 
% to find the range current values at which we get unstable spirals

a = 0.5;
I = 0:0.001:1;
b = 0.1; r = 0.1;

fvdash = zeros(length(I), 1);
Tau = zeros(length(I), 1);

% get intersection
for i = 1:length(I)
    Iext = I(i);
    NC = NCplot(Iext, b, r);
    round_v = round(NC(:,2), 4);
    round_w = round(NC(:,3), 4);
    
    pos = find(round_v == round_w);
    
    v = NC(:,2);
    if length(pos) ~= 0
        vfp = v(pos(1));
        fvdash(i) = dfdv(a, vfp);
        Tau(i) = fvdash(i) - 0.1;
    end
    
    
    
    
    
end