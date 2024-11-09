
%% Make LL1 and LL2 grid for all theoretically converging L1 and L2s.
alpha = .1;
NL = 10;
upperalphabound = 2*Mk*Mccoef^2/(Mp^2*(Mk^2+4*Mccoef^2*Lk^2));
Deltatupperbound = alpha*Mk/(4*Mccoef^2*Mk^2);
underboundL2 = 2*Deltat*Mk^2*Mp^2/mD-2;
underboundL1 = max(2*Mp^2*(Mk^2+4*Mccoef^2*Lk^2)/(Mk)-Mk)+0.1;
upperboundL2 = Mk*(underboundL1+Mk)/(Mp^2*(Mk^2+4*Mccoef^2*Lk^2))-2;
underalphabound = 2*(2+underboundL2)*Mccoef^2/(Mp^2*(underboundL1+10+Mk));

%[LL1,LL2] = meshgrid(linspace(-30,30,100),linspace(-30,30,100));
[LL1,LL2] = meshgrid(linspace(max(underboundL1,0),30,NL),linspace(max(underboundL2,0),upperboundL2,NL));
beta = max((1+(alpha*mD-4*Mccoef^2*Mk^2*Deltat)./(alpha*mD*LL1)).^(-1), ...
    (LL2*mD*Mk+4*Deltat*Mk*Mccoef^2*Mp^2*Lk^2+alpha*mD*Mp^2*Lk^2)./((LL2+2)*mD*Mk-2*Deltat*Mk^3*Mp^2));

%{
subplot(131)
surf(LL1,LL2,(1+(alpha*mD-4*Mccoef^2*Mk^2*Deltat)./(alpha*mD*LL1)).^(-1));shading interp; xlabel('L1'); ylabel('L2');zlabel('\beta_1')
subplot(132)
surf(LL1,LL2,(LL2*mD*Mk+4*Deltat*Mk*Mccoef^2*Mp^2*Lk^2+alpha*mD*Mp^2*Lk^2)./((LL2+2)*mD*Mk-2*Deltat*Mk^3*Mp^2));shading interp; xlabel('L1'); ylabel('L2');zlabel('\beta_2')
subplot(133);
surf(LL1,LL2,beta); shading interp; xlabel('L1'); ylabel('L2');zlabel('\beta')
xlabel('L1')
ylabel('L2')
zlabel('\beta')
%}