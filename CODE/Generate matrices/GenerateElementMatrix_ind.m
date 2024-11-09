%% Getting element info
Index = elmat(i,:);

xc = x(Index);
yc = y(Index);

Delta = abs(det([ones(topology,1) xc yc]));

B_mat = [ones(topology,1) xc yc] \  eye(topology);
%% Calculating t and k independant element matrices.
Mcelem = Delta/factorial(topology+1)*(1+eye(topology));
Selem = zeros(topology);
for index1 = 2:topology
    Selem = Selem + B_mat(index1,:)'*B_mat(index1,:);
end
SDelem = sum(D(Index))*Delta*Selem/factorial(topology); 
S1elem = Delta/factorial(topologybnd)*Selem;