clear S Selem

S 		= zeros(n,n); 

for i = 1:length(elmat(:,1)) % for all internal elements

    GenerateElementMatrix_tdep; %Generate S element matrix

    S(elmat(i,:),elmat(i,:))	= S(elmat(i,:),elmat(i,:)) + Selem;


end

Stilde = S(:,IndicesN); Stilde(IndicesN,:) = [];
S(IndicesN,:)=[]; S(:,IndicesN)=[];

