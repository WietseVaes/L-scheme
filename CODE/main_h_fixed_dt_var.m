%clearvars -except  Respvec Rescvec h Deltat indexerr Countervec L1 L2 alpha
%%%% Programma duurt lang, zet een breakpoint in comp line 52 om een
%%%% resultaat te krijgen en run daarna Post

clear all

Deltats = 10 .^ (-6:-2);
counter{length(Deltats)} = 0;
for i1 = 1:length(Deltats)
    clearvars -except  Deltats countermean i1 counter papprox capprox
    Lindex1 = i1;
    Lindex2 = 1;
    Mesh %Make Mesh
    Deltat = Deltats(i1);
    t = 0:Deltat:Tmax;
    nT = length(t);
    
    Parameters_ind %Getting time independant parameters
    mincounter = 15*ones(nT-1,1); %Stating minimal counter of iterations
    NL = 1;
    %L1L2bounds; %Getting the bounds of L1 and L2 for theoretical convergence factor<1
    L1 = 70;
    L2 = 0.0014;
    
    counter{i1} = zeros(nT-1,1);
    
    Comp %Compute p and c

    papprox{i1} = p;
    capprox{i1} = c;
    countermean(i1) = mean(counter{i1});
end
save("bad all")

for i1 = 1:5
    countermean(i1) = mean(counter{i1});
end


countermean_nice_permeability = countermean
counter_nice_permeability = counter
papprox_nice_permeability = papprox
capprox_nice_permeability = capprox
clear capprox papprox 
