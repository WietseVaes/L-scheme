clear all


K_types = {'constant','simple','bad Lipschitz','bad minimum', 'bad all'};

perm_type = 'constant';
NL = 10;
countermeanL2 = zeros(NL,length(K_types));
countermeanL1 = zeros(NL,length(K_types));
for i8 = 1:length(K_types)
    perm_type = K_types{i8};
Mesh %Make Mesh
Parameters_ind %Getting time independant parameters

mincounter = 15*ones(nT-1,1); %Stating minimal counter of iterations

%L1L2bounds; %Getting the bounds of L1 and L2 for theoretical convergence factor<1
LL1 = linspace(0,70,NL);
LL2 = LL1*0 + 0;
counter{NL} = 0; %Nl = #L1 and L2 gridpoints
for Lindex1 = 1:NL
        counter{Lindex1} = zeros(nT-1,1);
        L1 = LL1(Lindex1);
        L2 = LL2(Lindex1);
        Comp %Compute p and c
        countermeanL1(Lindex1,i8) = mean(counter{Lindex1});
end

%Post

NL = 10;
%L1L2bounds; %Getting the bounds of L1 and L2 for theoretical convergence factor<1
LL2 = linspace(0,70,NL);
LL1 = LL2*0 + 0;
counter{NL} = 0; %Nl = #L1 and L2 gridpoints
for Lindex1 = 1:NL
        counter{Lindex1} = zeros(nT-1,1);
        L1 = LL1(Lindex1);
        L2 = LL2(Lindex1);
        Comp %Compute p and c
        countermeanL2(Lindex1,i8) = mean(counter{Lindex1});
end
end

subplot(121)
plot(LL2,countermeanL1,'linewidth',2)
legend('$k=1$','$1+c^2$','$1+\sqrt(|c|)$','$(1-c)^2$', '$\sqrt{|c|}$','Interpreter','latex');
xlabel("$L_1$",'interpreter', 'latex', 'fontsize',20);ylabel("mean iterations/timestep",'interpreter', 'latex', 'fontsize',20);
subplot(122)
plot(LL2,countermeanL2,'linewidth',2)
legend('$k=1$','$1+c^2$','$1+\sqrt(|c|)$','$(1-c)^2$', '$\sqrt{|c|}$','Interpreter','latex');
xlabel("$L_2$",'interpreter', 'latex', 'fontsize',20);ylabel("mean iterations/timestep",'interpreter', 'latex', 'fontsize',20);
sgtitle("Mean iterations per timestep with $L_1$ and $L_2$ variable",'interpreter','latex','fontsize',20)
%Natuurkundig oplossing plotten (vooral random permeability)
%%%% contour functie maken van combinaties van L1 en L2