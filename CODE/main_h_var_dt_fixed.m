%clearvars -except  Respvec Rescvec h Deltat indexerr Countervec L1 L2 alpha
%%%% Programma duurt lang, zet een breakpoint in comp line 52 om een
%%%% resultaat te krijgen en run daarna Post

clear all

hs = 2 .^ (-1:-1:-4);

for i1 = 1:length(hs)
    clearvars -except  hs countermean i1
    h_spacing = hs(i1);
    Mesh %Make Mesh
    
    Parameters_ind %Getting time independant parameters
    
    mincounter = 15*ones(nT-1,1); %Stating minimal counter of iterations
    NL = 1;
    Lindex1 = 1;
    Lindex2 = 1;
    %L1L2bounds; %Getting the bounds of L1 and L2 for theoretical convergence factor<1
    L1 = 70;
    L2 = 10;
    
    counter{1} = zeros(nT-1,1);
    
    Comp %Compute p and c
    countermean(i1) = mean(counter{1});
end

save('Nice k h')
