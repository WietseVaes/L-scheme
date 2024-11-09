%% Making b vector 
bc 		= zeros(n,1);

b 		= zeros(n,1);

for i = 1:length(elmat(:,1)) % for all internal elements

    GenerateElementVector_tdep; %calculating b vector over current element 
    for ind1 = 1:topology
        bc(elmat(i,ind1)) = bc(elmat(i,ind1)) + bcelem(ind1);
        b(elmat(i,ind1)) = b(elmat(i,ind1)) + belem(ind1);
    end

end
clear xc yc
for i = 1:length(elmatbnd(:,1)) % for all boundary elements extension of mass matrix M and element vector f
    GenerateBoundaryElementVector_tdep; %calculating b vector over current neumann boundary element
    for ind1 = 1:topologybnd
        bc(elmatbnd(i,ind1)) = bc(elmatbnd(i,ind1)) + bbcelem(ind1);
        b(elmatbnd(i,ind1)) = b(elmatbnd(i,ind1)) + bbelem(ind1);
    end
end

%Deleting dirichlet boundary indices
b(IndicesN) = [];
bc(IndicesNc) = [];

%Stating used dirichlet boundary conditions
hvec = h(IndicesN,j);
hcvec = hc(IndicesNc,j);

%Calculating h derived by t.
if j ~= nT && j ~= 1
    diffthcvec = (hc(IndicesNc,j+1)-hc(IndicesNc,j-1))/(2*Deltat);
elseif j == nT
    diffthcvec = (hc(IndicesNc,j)-hc(IndicesNc,j-1))/(Deltat);
else 
    diffthcvec = (hc(IndicesNc,j+1)-hc(IndicesNc,j))/(Deltat);
end