

for i1 = 1:length(t)
    figure(1)
    subplot(121)
    trisurf(elmat,x,y,abs((c(:,i1)-csol(:,i1)))); shading interp;  cmocean('curl'); view(2); colorbar
    subplot(122)
    trisurf(elmat,x,y,c(:,i1)); shading interp;  cmocean('curl'); view(2); colorbar
    figure(2)
    subplot(121)
    trisurf(elmat,x,y,abs((p(:,i1)-psol(:,i1)))); shading interp;  cmocean('curl'); view(2); colorbar
    subplot(122)
    trisurf(elmat,x,y,p(:,i1)); shading interp;  cmocean('curl'); view(2); colorbar
    pause(.1)
end







