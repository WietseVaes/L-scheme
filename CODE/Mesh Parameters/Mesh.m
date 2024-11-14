%% Time discretisation
Tmax = 0.3;
if ~exist('Deltat')
    Deltat = 1e-2;
end
t = 0:Deltat:Tmax;
nT = length(t);

%% Spatial discretization 
if ~exist('h_spacing')
    h_spacing = 0.1;
end
TOL = 1e-8;
[XX,YY] = meshgrid(-1:h_spacing:1,-1:h_spacing:1);
x = reshape(XX,size(XX,1)^2,1);y = reshape(YY,size(YY,1)^2,1);
elmat = delaunay(x,y);
%triplot(elmat,x,y)
elmatbnd = [];
for index1 = 1:size(elmat,1)
    xonedge = abs(x(elmat(index1,:)))==1;
    yonedge = abs(y(elmat(index1,:)))==1;
    if sum(xonedge) == 2 && sum(yonedge) == 2
        elmatbnd = [elmatbnd; elmat(index1,xonedge)];
        elmatbnd = [elmatbnd; elmat(index1,yonedge)];
    elseif sum(yonedge) == 2
         elmatbnd = [elmatbnd; elmat(index1,yonedge)];
    elseif sum(xonedge) == 2
        elmatbnd = [elmatbnd; elmat(index1,xonedge)];
    end
end

%% topology info
topology = 3; topologybnd = 2;

n = length(x);
 
