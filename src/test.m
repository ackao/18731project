%clearvars;
format long;
filename1 = 'Phil_nextescape_100ms.csv';


Phil_NextEscape = csvread(filename1,1,0);


pne = Phil_NextEscape(:,2);


pne = pne/norm(pne);


z = zeros(300, 1);
pne2 = [z; pne];

t1 = Phil_NextEscape(:,1);
t2 = Gangnam(:,1);

% subplot(2,1,1)
% plot(t1,pne)
% title('Phil Next Escape')
% 
% subplot(2,1,2)
% plot(t2,gan)
% title('Gangnam')

spne = sgolayfilt(pne, 3, 41);
syne = sgolayfilt(yne, 3, 41);

figure
subplot(2,1,1)
plot(t1, pne)
title('pne')

subplot(2,1,2)
plot(t1, spne)
title('sgolay filt pne')

[acor1,lag1] = xcorr(pne, pne);
[acor2,lag2] = xcorr(pne, gan);
[acor3,lag3] = xcorr(pne, pne2);
[acor4,lag4] = xcorr(pne, yne);
[acor5,lag5] = xcorr(pne, div);

[acor6, lag6] = xcorr(spne, syne);

NUM_PLOTS = 5;

% figure
% subplot(NUM_PLOTS,1,1)
% plot(lag1, acor1)
% title('pne x pne')
% 
% subplot(NUM_PLOTS,1,2)
% plot(lag2, acor2)
% title('pne x gan')
% 
% subplot(NUM_PLOTS,1,3)
% plot(lag3, acor3)
% title('pne x pne2')
% 
% subplot(NUM_PLOTS,1,4)
% plot(lag4, acor4)
% title('pne x yne')
% 
% subplot(NUM_PLOTS,1,5)
% plot(lag5, acor5)
% title('pne x div')

% div = div(1:2137,:);
% pne = pne(1:2137,:);
% gan = gan(1:2137,:);
% 
% [r1,p1] = corrcoef(pne, yne);
% [r2,p2] = corrcoef(pne, div);
% [r3,p3] = corrcoef(yne, div);
% [r4,p4] = corrcoef(pne, gan);
% [r5,p5] = corrcoef(div, gan);