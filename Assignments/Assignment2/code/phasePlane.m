function phasePlane(I, V0,W0, b, r, trajectory)

% Plotting the V and W nullclines and the trajectories 
niter = 20000;
a = Fmodel(I, V0, W0, niter, b, r);
NC = NCplot(I, b, r);


ax1 = nexttile;
if trajectory == false

    plot( NC(:,1), NC(:,2), NC(:,1), NC(:,3), 'LineWidth', 2.0);
    legend('V-nc', 'W-nc')
else
    plot( a(:, 2), a(:, 3),'--', NC(:,1), NC(:,2), NC(:,1), NC(:,3), 'LineWidth', 2.0);
    legend('limit cycle', 'V-nc', 'W-nc')

    
grid(ax1,'on')
xlabel('V'), ylabel('W');


end