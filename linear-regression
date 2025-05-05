clear all, close all,clc

x=3;

a=[-2:.25:2]';
a=a+1*randn(size(a))
b=a*x+ 1*randn(size(a)); % normal distribution
plot(a,x*a,'k','Linewidth',2) % this is true line
hold
plot(a,b,'rx','Linewidth',1.5)


%but if we haven't x

[U,S,V]=svd(a,'econ');
xPseudo=V*inv(S)*U'*b;
%another:
%xPseudo = pinv(a)*b
%xPseudo=regress(b,a)
plot(a,xPseudo*a,'b--')
