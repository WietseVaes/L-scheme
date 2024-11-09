function res = pDirichletBD(x,y,index1)
if length(index1)>1
    res = abs(x(index1))>=1-eps | abs(y(index1)) >=1-eps; %All dirichlet
else
    res = abs(x(index1))>=1-eps || abs(y(index1)) >=1-eps; %All dirichlet
end
