%% Getting element info
Index = elmat(i,:);

xc = x(Index);
yc = y(Index);

Delta = abs(det([ones(topology,1) xc yc]));

%% Calculating b and bc vector over viewed element.
belem = Delta/factorial(topology)*f(Index,j);
bcelem = Delta/factorial(topology)*fc(Index,j);