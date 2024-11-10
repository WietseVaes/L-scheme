%% Getting element info
Index = elmat(i,:);
xc = x(Index);
yc = y(Index);

Delta = abs(det([ones(topology,1) xc yc]));

B_mat = [ones(topology,1) xc yc] \  eye(topology);

%% Calculating k dependant element matrices.
Selem = zeros(topology);
for index1 = 2:topology
    Selem = Selem + B_mat(index1,:)'*B_mat(index1,:); %3x1 * 1x3 = 3x3
end
Selem = sum(permeability(Index,j))*Delta/viscosity*Selem/6;