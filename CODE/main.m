%clearvars -except  Respvec Rescvec h Deltat indexerr Countervec L1 L2 alpha
%%%% Programma duurt lang, zet een breakpoint in comp line 52 om een
%%%% resultaat te krijgen en run daarna Post

clear all


Mesh %Make Mesh
Parameters_ind %Getting time independant parameters

mincounter = 15*ones(nT-1,1); %Stating minimal counter of iterations
NL = 10;
%L1L2bounds; %Getting the bounds of L1 and L2 for theoretical convergence factor<1
LL1 = linspace(0,70,NL);
LL2 = LL1*0+10;
counter{NL} = 0; %Nl = #L1 and L2 gridpoints
countermeanL1 = zeros(NL,1);
for Lindex1 = 1:NL
        counter{Lindex1} = zeros(nT-1,1);
        L1 = LL1(Lindex1);
        L2 = LL2(Lindex1);
        Comp %Compute p and c
        countermeanL1(Lindex1) = mean(counter{Lindex1});
end

%Post

NL = 10;
%L1L2bounds; %Getting the bounds of L1 and L2 for theoretical convergence factor<1
LL2 = linspace(0,70,NL);
LL1 = LL2*0 + 10;
counter{NL} = 0; %Nl = #L1 and L2 gridpoints
countermeanL2 = zeros(NL,1);
for Lindex1 = 1:NL
        counter{Lindex1} = zeros(nT-1,1);
        L1 = LL1(Lindex1);
        L2 = LL2(Lindex1);
        Comp %Compute p and c
        countermeanL2(Lindex1) = mean(counter{Lindex1});
end

%Natuurkundig oplossing plotten (vooral random permeability)
%%%% contour functie maken van combinaties van L1 en L2