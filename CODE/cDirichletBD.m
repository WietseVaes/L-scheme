function res = cDirichletBD(x,y,index1)
if length(index1)>1
    res = (abs(y(index1)) >= 1-eps | abs(x(index1))>=1-eps ); %All dirichlet
else %Same as above
    res = (abs(y(index1)) >= 1-eps || abs(x(index1))>=1-eps );
end