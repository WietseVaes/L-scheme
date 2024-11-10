%% Element parameters
%view x and y coords of the element
xc = x(elmat(i,:));
yc = y(elmat(i,:));

%Calculate 2*area of element
Delta = abs(det([ones(topology,1) xc yc]));

%Calculate coefficients of help functions
B_mat = [ones(topology,1) xc yc] \  eye(topology);
%% Generate element matrix V
PP = zeros(1,topologybnd);

for index1 = 2:topology
    PP(index1-1) = B_mat(index1,:)*p(elmat(i,:),j);
end

VV = zeros(topology,1);
for index1 = 1:topology
    VV(index1) = PP*B_mat(2:topology,index1);
end

Velem = zeros(topology);
for index1 = 1:topology
    for index2 = 1:topology
        Velem(index1,index2) = permeability(elmat(i,index2),j)*VV(index1);
    end
end
Velem = Velem/viscosity*Delta/6;
