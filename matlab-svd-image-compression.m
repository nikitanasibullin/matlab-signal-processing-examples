clear all
clc
A=imread("picture.jpg");
X=double(rgb2gray(A));
nx=size(X,1);
ny=size(X,2);

figure, subplot(2,2,1);
axis off;
colormap('gray')
imagesc(X)
axis equal
[U,S,V] = svd(X,'econ');
plotInd=2
for r=[3 10 200]
  xApprox = U(:,1:r)*S(1:r,1:r)*V(:,1:r)';
  subplot(2,2,plotInd);
  plotInd+=1;
  imagesc(xApprox), axis off, colormap('gray')
  title(["r=",num2str(r,'%d')])
  axis equal
endfor

%plotting singular values from S
figure, subplot(1,2,1)
semilogy(diag(S),'k','linewidth',2), grid on
xlabel('r')
ylabel('singular value')
xlim([-50,nx+50])

subplot(1,2,2)
plot(cumsum(diag(S))/sum(diag(S)),'k','linewidth',2)
