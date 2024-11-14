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
    countermean(i25,i80) = mean(counter{1});
    conv_rate_full{i25,i80} = conv_rate;
    conv_rate_mean{i25,i80} = mean(conv_rate);
end
disp([K_types{i80}, ' is done.'])
end
save("dt var results all 2")
