%Load new matrices

S 		= zeros(n,n); % stiffness matrix

Mc 		= zeros(n,n);

SD		= zeros(n,n);

S1     = zeros(n,n);

for i = 1:length(elmat(:,1)) % for all elements

    GenerateElementMatrix_ind; GenerateElementMatrix_tdep; %Builds the part of the matrices over the viewed element.
    for ind1 = 1:topology
        for ind2 = 1:topology
            S1(elmat(i,ind1),elmat(i,ind2))	= S1(elmat(i,ind1),elmat(i,ind2)) + S1elem(ind1,ind2);
            SD(elmat(i,ind1),elmat(i,ind2))	= SD(elmat(i,ind1),elmat(i,ind2)) + SDelem(ind1,ind2);
            Mc(elmat(i,ind1),elmat(i,ind2))	= Mc(elmat(i,ind1),elmat(i,ind2)) + Mcelem(ind1,ind2);
            S(elmat(i,ind1),elmat(i,ind2))	= S(elmat(i,ind1),elmat(i,ind2)) + Selem(ind1,ind2);
        end
    end


end

%Makes the matrices used for the elements on the dirichlet boundary condition

Mctilde = Mc(:,IndicesNc); Mctilde(IndicesNc,:) = [];
S1tilde = S1(:,IndicesN); S1tilde(IndicesN,:) = [];
SDtilde = SD(:,IndicesNc); SDtilde(IndicesNc,:) = [];
Stilde = S(:,IndicesN); Stilde(IndicesN,:) = [];

%Makes the matrices used for all elements not on the dirichlet boundary condition

Mc(IndicesNc,:)=[];Mc(:,IndicesNc)=[];
S1(IndicesN,:)=[];S1(:,IndicesN)=[];
SD(IndicesNc,:)=[];SD(:,IndicesNc)=[];
S(IndicesN,:)=[]; S(:,IndicesN)=[];