clear V Velem

V 		= sparse(n,n); 

for i = 1:length(elmat(:,1)) % for all internal elements

    GenerateVMatrix; %Generate V element matrix

    V(elmat(i,:),elmat(i,:))	= V(elmat(i,:),elmat(i,:)) + Velem;


end

Vtilde = V(:,IndicesNc); Vtilde(IndicesNc,:) = [];
V(IndicesNc,:)=[]; V(:,IndicesNc)=[];