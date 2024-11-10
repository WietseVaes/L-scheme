%clearvars -except  Respvec Rescvec h Deltat indexerr Countervec L1 L2 alpha
%%%% Programma duurt lang, zet een breakpoint in comp line 52 om een
%%%% resultaat te krijgen en run daarna Post

clear all

K_types = {'constant','simple','bad Lipschitz','bad minimum', 'bad all'};


Deltats = 10 .^ (-6:-2);
counter{length(Deltats)} = 0;
for i80 = 1:length(K_types)
    perm_type = K_types{i80};
for i25 = 1:length(Deltats)
    clearvars -except  Deltats countermean i1 counter papprox capprox K_types perm_type
    Lindex1 = 1;
    Lindex2 = 1;
    Mesh %Make Mesh
    Deltat = Deltats(i25);
    t = 0:Deltat:Tmax;
    nT = length(t);
    
    Parameters_ind %Getting time independant parameters
    mincounter = 15*ones(nT-1,1); %Stating minimal counter of iterations
    NL = 1;
    %L1L2bounds; %Getting the bounds of L1 and L2 for theoretical convergence factor<1
    L1 = 70;
    L2 = 0.0014;
    
    counter{i25} = zeros(nT-1,1);
    
    Comp %Compute p and c

    papprox{i25,i80} = p;
    capprox{i25,i80} = c;
    countermean(i25,i80) = mean(counter{i80});
end
end
save("bad all")
