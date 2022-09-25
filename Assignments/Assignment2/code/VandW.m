function VandW( I,V0, W0, b, r)
% plotting V vs T and W vs T
niter = 10000;
a = Fmodel(I, V0, W0, niter,b,r);
plot(a(:,1), a(:, 2), a(:,1) ,a(:, 3), 'LineWidth', 2.0);
xlabel('t'), ylabel('V and W');
legend('V', 'W')

end