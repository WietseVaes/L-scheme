%clearvars -except  Respvec Rescvec h Deltat indexerr Countervec L1 L2 alpha
%%%% Programma duurt lang, zet een breakpoint in comp line 52 om een
%%%% resultaat te krijgen en run daarna Post

clear all

K_types = {'constant','simple','bad Lipschitz','bad minimum', 'bad all'};


Deltats = 10 .^ (-4:-2);
counter{length(Deltats)} = 0;
for i80 = 1:length(K_types)
    perm_type = K_types{i80};
for i25 = 1:length(Deltats)
    clearvars -except  Deltats countermean i25 counter papprox capprox K_types perm_type i80 conv_rate_mean conv_rate_full
    Lindex1 = 1;
    Lindex2 = 1;
    Deltat = Deltats(i25);
    Mesh %Make Mesh
    
    Parameters_ind %Getting time independant parameters
    mincounter = 15*ones(nT-1,1); %Stating minimal counter of iterations
    NL = 1;
    %L1L2bounds; %Getting the bounds of L1 and L2 for theoretical convergence factor<1
    L1 = 70;
    L2 = 1;
    
    counter{1} = zeros(nT-1,1);
    
    Comp %Compute p and c

    papprox{i25,i80} = p;
    capprox{i25,i80} = c;
    counter_full{i25,i80} = counter{1};
    countermean(i25,i80) = mean(counter{1});
    conv_rate_full{i25,i80} = conv_rate;
    conv_rate_mean{i25,i80} = mean(conv_rate);
end
disp([K_types{i80}, ' is done.'])
end
save("dt var results all")

figure(43); hold on
colors = {'k','b','g','r'};
names = {'$k=1$','$1+c^2$','$1+\sqrt(|c|)$','$(1-c)^2$', '$\sqrt{|c|}$'};


figure(43); hold on
plot(1e-4:1e-4:.3,conv_rate_full{1,1}, 'linewidth',2,'Color','k'); hold on
plot(1e-3:1e-3:.3,conv_rate_full{2,1}, 'linewidth',2,'Color','b')
plot(1e-2:1e-2:.3,conv_rate_full{3,1}, 'linewidth',2,'Color','g')
% plot(t(2:end),conv_rate_full{4,1}, 'linewidth',2,'Color','r')
legend('$\Delta t=1e-4$','$1e-3$','$1e-2$','interpreter','latex','fontsize',15);
xlabel('$t$','interpreter','latex','FontSize',20);
ylabel('$\beta$','interpreter','latex','FontSize',20)
title('Convergence factor for $k=1$ with different temporal spacings','interpreter','latex','FontSize',20)
hold off

figure(44); subplot(221);hold on
plot(1e-4:1e-4:.3,conv_rate_full{1,2}, 'linewidth',2,'Color','k'); hold on
plot(1e-3:1e-3:.3,conv_rate_full{2,2}, 'linewidth',2,'Color','b')
plot(1e-2:1e-2:.3,conv_rate_full{3,2}, 'linewidth',2,'Color','g')
% plot(t(2:end),conv_rate_full{4,2}, 'linewidth',2,'Color','r')
legend('$\Delta t=1e-4$','$1e-3$','$1e-2$','interpreter','latex','fontsize',15);
xlabel('$t$','interpreter','latex','FontSize',20);
ylabel('$\beta$','interpreter','latex','FontSize',20)
title('Convergence factor for $k=1+c^2$ with different temporal spacings','interpreter','latex','FontSize',20)
hold off

subplot(222);hold on
plot(1e-4:1e-4:.3,conv_rate_full{1,3}, 'linewidth',2,'Color','k'); hold on
plot(1e-3:1e-3:.3,conv_rate_full{2,3}, 'linewidth',2,'Color','b')
plot(1e-2:1e-2:.3,conv_rate_full{3,3}, 'linewidth',2,'Color','g')
% plot(t(2:end),conv_rate_full{4,3}, 'linewidth',2,'Color','r')
legend('$\Delta t=1e-4$','$1e-3$','$1e-2$','interpreter','latex','fontsize',15);
xlabel('$t$','interpreter','latex','FontSize',20);
ylabel('$\beta$','interpreter','latex','FontSize',20)
title('Convergence factor for $k=1+\sqrt{|c|}$ with different temporal spacings','interpreter','latex','FontSize',20)
hold off

subplot(223);hold on
plot(1e-4:1e-4:.3,conv_rate_full{1,4}, 'linewidth',2,'Color','k'); hold on
plot(1e-3:1e-3:.3,conv_rate_full{2,4}, 'linewidth',2,'Color','b')
plot(1e-2:1e-2:.3,conv_rate_full{3,4}, 'linewidth',2,'Color','g')
% plot(t(2:end),conv_rate_full{4,4}, 'linewidth',2,'Color','r')
legend('$\Delta t=1e-4$','$1e-3$','$1e-2$','interpreter','latex','fontsize',15);
xlabel('$t$','interpreter','latex','FontSize',20);
ylabel('$\beta$','interpreter','latex','FontSize',20)
title('Convergence factor for $k=(1-c)^2$ with different temporal spacings','interpreter','latex','FontSize',20)
hold off

subplot(224);hold on
plot(1e-4:1e-4:.3,conv_rate_full{1,5}, 'linewidth',2,'Color','k'); hold on
plot(1e-3:1e-3:.3,conv_rate_full{2,5}, 'linewidth',2,'Color','b')
plot(1e-2:1e-2:.3,conv_rate_full{3,5}, 'linewidth',2,'Color','g')
% plot(t(2:end),conv_rate_full{4,5}, 'linewidth',2,'Color','r')
legend('$\Delta t=1e-4$','$1e-3$','$1e-2$','interpreter','latex','fontsize',15);
xlabel('$t$','interpreter','latex','FontSize',20);
ylabel('$\beta$','interpreter','latex','FontSize',20)
title('Convergence factor for $k=\sqrt{|c|}$ with different temporal spacings','interpreter','latex','FontSize',20)
hold off
