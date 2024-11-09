
%Calculate points not on the dirichlet boundary.
if j == 1
    pp = (S) \ (b-Stilde*hvec);
else
    %if counter{Lindex1,Lindex2}(j-1) == 0
    if counter{Lindex1}(j-1) == 0
        pp = (S+L1*S1) \ (b-Stilde*hvec+L1*(S1*pold(indices)+S1tilde*(h(IndicesN,j-1)-hvec)));
    else
        pp = (S+L1*S1) \ (b-Stilde*hvec+L1*(S1*pold(indices)));
    end
end
p(indices,j) = pp; %puts approximations in the solution matrix
p(IndicesN,j) = hvec; %Puts the dirichlet boundary condition in the solution matrix
clear pp