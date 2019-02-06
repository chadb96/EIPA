clear all
close all
%global C
%C.q_0 = 1.60217653e-19;
%paras= [0*C.q_0];
%pot= @Pot_const;
nx=50;
ny=50;
G= sparse(nx*ny,nx*ny);
for i= 1:1:nx
    for j= 1:1:ny
        n=j+(i-1)*ny;
        if i ==1 || i==nx || j==1 || j==ny
            G(n,:)=0;
            G(n,n)=1;
        else
            G(n,n)= -4;
            G(n,n+1)= 1;
            G(n,n-1)= 1;
            G(n,n+ny)= 1;
            G(n,n-ny)= 1;
        end
    end       
end
figure(1)
spy(G)
[E,D]= eigs(G,9,'SM');

figure(2)
Z= zeros(nx,ny,9);
 for count= 1:9
    Z(:,:,count) = reshape(E(:, count), nx, ny);
    subplot(3,3,count)
     surf(Z(:,:,count))
end
    
      