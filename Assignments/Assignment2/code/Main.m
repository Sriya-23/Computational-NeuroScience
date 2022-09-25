%Main

b = 0.1; r = 0.1;
%Case 1 
%i) V0 <a, W0 = 0
I = 0;
V0 = 0.2;
W0 = 0;
figure(1)
phasePlane(I, V0,W0,b,r, true);
title('Figure 1: Phase plot, Iext = 0, V0 = 0.2, W0 = 0');
figure(2)
VandW(I,V0,W0,b,r);
title("Figure 2: V vs T and W vs T, Iext = 0, V0 = 0.2, W0 = 0");

%ii) V0 >a, W0 = 0
I = 0;
V0 = 0.8;
W0 = 0;
figure(3)
phasePlane(I, V0,W0,b,r, true);
title("Figure 3: Phase plot, Iext = 0, V0 = 0.8, W0 = 0");
figure(4)
VandW(I,V0,W0,b,r);
title("Figure 4: V vs T and W vs T, Iext = 0, V0 = 0.8, W0 = 0");

%Case 2
% The values for I1 and I2 were calculated through stability analysis
% delta > 0 and Tau > 0 for focus
% I1 = 0.3211, I2 = 0.6789
% limit cycles/ oscillations were observed at Iext = 0.5
I = 0.5;
V0 = 0.5;
W0 = 0.5;
figure(5)
phasePlane(I, V0,W0,b,r, true);
title("Figure 5: Phase plot, Iext = 0.5, V0 = 0.5, W0 = 0.5");
figure(6)
VandW(I,V0,W0,b,r);
title("Figure 6: V vs T and W vs T, Iext = 0.5, V0 = 0.5, W0 = 0.5");

%Show unstability 
I = 0.5;
V0 = 0.52;
W0 = 0.52;
figure(7)
phasePlane(I, V0,W0,b,r, true);
title("Figure 7: Phase plot, Iext = 0.5, V0 = 0.52, W0 = 0.52");
figure(8)
VandW(I,V0,W0,b,r);
title("Figure 8: V vs T and W vs T, Iext = 0.5, V0 = 0.52, W0 = 0.52");


% Case 3

% I > I2
I = 1.0;
V0 = 1.0;
W0 = 1.0;
figure(9)
phasePlane(I, V0,W0,b,r, true);
title("Figure 9: Phase plot, Iext = 1.0, V0 = 1.0, W0 = 1.0");
figure(10)
VandW(I,V0,W0,b,r);
title("Figure 10: V vs T and W vs T, Iext = 1.0, V0 = 1.0, W0 = 1.0");

% Showing stability of fixed point
V0 = 1.1;
W0 = 1.1;
figure(11)
phasePlane(I, V0,W0,b,r, true);
title("Figure 11: Phase plot, Iext = 1.0, V0 = 1.1, W0 = 1.1");
figure(12)
VandW(I,V0,W0,b,r);
title("Figure 12: V vs T and W vs T, Iext = 1.0, V0 = 1.1, W0 = 1.1");


% Case 4 
%  3 intersection points at p1, p2, p3
I = 0.05;
b = 0.1;  r = 1;
figure(13)
phasePlane(I, V0,W0,b,r, false);
title("Figure 13: Phase plot, Iext = 0.05, b = 0.1, r = 1");

% p1
V0 = 0.1127; W0 = 0.01127;
figure(14)
phasePlane(I, V0,W0,b,r, true);
title("Figure 14: Phase plot, Iext = 0.05, b = 0.1, r = 1, V0 = 0.1127, W0 = 0.01127");
figure(15)
VandW(I,V0,W0,b,r);
title("Figure 15: V vs T and W vs T, Iext = 0.05, b = 0.1, r = 1, V0 = 0.1127, W0 = 0.01127 ");

%stability
V0 = 0.3; W0 = 0.05;
figure(16)
phasePlane(I, V0,W0,b,r, true);
title("Figure 16: Phase plot, Iext = 0.05, b = 0.1, r = 1, V0 = 0.3, W0 = 0.05");
figure(17)
VandW(I,V0,W0,b,r);
title("Figure 17: V vs T and W vs T, Iext = 0.05, b = 0.1, r = 1, V0 = 0.3, W0 = 0.05 ");


%p2
V0 = 0.5; W0 = 0.05;
figure(18)
phasePlane(I, V0,W0,b,r, true);
title("Figure 18: Phase plot, Iext = 0.05, b = 0.1, r = 1, V0 = 0.5, W0 = 0.05");
figure(19)
VandW(I,V0,W0,b,r);
title("Figure 19: V vs T and W vs T, Iext = 0.05, b = 0.1, r = 1, V0 = 0.5, W0 = 0.05 ");

%stability
V0 = 0.4; W0 = 0.06;
figure(20)
phasePlane(I, V0,W0,b,r, true);
title("Figure 20: Phase plot, Iext = 0.05, b = 0.1, r = 1, V0 = 0.5, W0 = 0.1");
figure(21)
VandW(I,V0,W0,b,r);
title("Figure 21: V vs T and W vs T, Iext = 0.05, b = 0.1, r = 1,  V0 = 0.5, W0 = 0.1");



%p3
V0 = 0.8873; W0 = 0.08873;
figure(22)
phasePlane(I, V0,W0,b,r, true);
title("Figure 22: Phase plot, Iext = 0.05, b = 0.1, r = 1, V0 = 0.8873, W0 = 0.08873");
figure(23)
VandW(I,V0,W0,b,r);
title("Figure 23: V vs T and W vs T, Iext = 0.05, b = 0.1, r = 1, V0 = 0.8873, W0 = 0.08873");

%stability
V0 = 1.0; W0 = 0.2;
figure(24)
phasePlane(I, V0,W0,b,r, true);
title("Figure 24: Phase plot, Iext = 0.05, b = 0.1, r = 1, V0 = 1.0, W0 = 1.0");
figure(25)
VandW(I,V0,W0,b,r);
title("Figure 25: V vs T and W vs T, Iext = 0.05, b = 0.1, r = 1,  V0 = 1.0, W0 = 1.0");

