clear all

K_types = {'constant','simple','bad Lipschitz','bad minimum', 'bad all'};

hs = 2 .^ (-1:-1:-4);
for i80 = 1:length(K_types)
    perm_type = K_types{i80};
for i15 = 1:length(hs)
    clearvars -except  hs countermean i15 K_types perm_type conv_rate_full conv_rate_mean i80 
    h_spacing = hs(i15);
    Deltat = 1e-3;
    Mesh %Make Mesh
    
    Parameters_ind %Getting time independant parameters
    
    NL = 1;
    Lindex1 = 1;
    Lindex2 = 1;
    %L1L2bounds; %Getting the bounds of L1 and L2 for theoretical convergence factor<1
    L1 = 70;
    L2 =  1;
    
    counter{1} = zeros(nT-1,1);
    
    Comp %Compute p and c
    papprox{i25,i80} = p;
    capprox{i25,i80} = c;
    countermean(i25,i80) = mean(counter{i80});
    conv_rate_full{i15,i80} = conv_rate;
    conv_rate_mean{i15,i80} = mean(conv_rate);
end
    disp([K_types{i80}, ' is done.'])
end


