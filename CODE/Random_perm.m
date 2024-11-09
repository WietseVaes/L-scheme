
sigma = 1;lambda = 1;

for i = 1:n
    for j = 1:n
        Sperm(i,j) = sigma*exp(-(abs(x(i)-x(j))^1+abs(y(i)-y(j))^1)/lambda);
    end
end
L = chol(Sperm);
logkuncor = randn(n,1);
logk = L'*logkuncor;
k = exp(logk);

permeability = k*(10^(-2));
D = permeability*(10^(1));

%{
figure(1)
surf(reshape(x,sqrt(n),[]),reshape(y,sqrt(n),[]),reshape(k,sqrt(n),[]))
figure(2)
contourf(reshape(x,sqrt(n),[]),reshape(y,sqrt(n),[]),reshape(k,sqrt(n),[]));colorbar;
%}
%figure(8)
%trisurf(elmat,x,y,permeability)
%}

%{
field = ones(n,1);
for index1 = 1:n
    if rand(1)>=0.55
        field(index1) = 1/20;
    end
end
%}
