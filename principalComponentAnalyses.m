clear all, close all, clc
xC=[2;1;];
sig=[2;.5;];

theta=pi/3
R=[cos(theta) -sin(theta); sin(theta) cos(theta)]

nPoints=10000;
X=R*diag(sig)*randn(2,nPoints)+diag(xC)*ones(2,nPoints);

subplot(1,2,1)
scatter(X(1,:),X(2,:),'.','Linewidth',1)
hold on, box on, grid on
axis([-6 8 -6 8])

Xavg=mean(X,2) %compute mean vector of all data(close to the center)
B=X-Xavg*ones(1,nPoints); %mean centered
[U,S,V] = svd(B/sqrt(nPoints),'econ') %normalazing B

subplot(1,2,2)
scatter(X(1,:),X(2,:),'.','Linewidth',1)
hold on, box on, grid on
axis([-6 8 -6 8])

theta=(0:.01:1)*2*pi;
[Xstd] = U*S*[cos(theta);sin(theta)];
plot(Xavg(1)+Xstd(1,:),Xavg(2)+Xstd(2,:),'-r')
plot(Xavg(1)+2*Xstd(1,:),Xavg(2)+2*Xstd(2,:),'-r')
plot(Xavg(1)+3*Xstd(1,:),Xavg(2)+3*Xstd(2,:),'-r')
