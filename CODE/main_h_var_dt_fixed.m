clear all

K_types = {'constant','simple','bad Lipschitz','bad minimum', 'bad all'};

hs = 2 .^ (-1:-1:-4);
for i80 = 1:length(K_types)
    perm_type = K_types{i80};
for i15 = 1:length(hs)
    clearvars -except  hs countermean i1 K_types perm_type
    h_spacing = hs(i15);
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
    countermean(i15,i80) = mean(counter{1});
end
    disp([K_types{i80}, 'is done.'])
end


