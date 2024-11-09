%% Loading element info
xc = x(elmatbnd(i,:));
yc = y(elmatbnd(i,:));

Index = elmatbnd(i,:)';

%% Calculating b and bc over viewed boundary element 

Gs1 = g1(Index,j); Gc1 = gc1(Index,j);
Gs2 = g2(Index,j); Gc2 = gc2(Index,j);
Gs3 = g3(Index,j); Gc3 = gc3(Index,j);
Gs4 = g4(Index,j); Gc4 = gc4(Index,j);
Gssource = gsource(Index,j); Gcsource = gcsource(Index,j);
if topologybnd ==2
    dist = sqrt((xc(2)-xc(1))^2+(yc(2)-yc(1))^2);
else
    dist = abs(det([ones(topologybnd,1) xc yc]));
end

bbelem = zeros(topologybnd,1);
bbcelem = zeros(topologybnd,1);

if all(xc <= -1+eps)
    if ~all(cDirichletBD(x,y,elmatbnd(i,:)))
        bbcelem = dist/factorial(topologybnd)*Gc1;
    end
    if ~all(pDirichletBD(x,y,elmatbnd(i,:)))
        bbelem = dist/factorial(topologybnd)*Gs1;
    end
elseif all(xc>= 1-eps)
    if ~all(cDirichletBD(x,y,elmatbnd(i,:)))
        bbcelem = dist/factorial(topologybnd)*Gc2;
    end
    if ~all(pDirichletBD(x,y,elmatbnd(i,:)))
        bbelem = dist/factorial(topologybnd)*Gs2;
    end
end
if all(yc<= -1+eps)
    if ~all(cDirichletBD(x,y,elmatbnd(i,:)))
        bbcelem = dist/factorial(topologybnd)*Gc3;
    end
    if ~all(pDirichletBD(x,y,elmatbnd(i,:)))
        bbelem = dist/factorial(topologybnd)*Gs3;
    end
elseif all(yc>= 1-eps)
    if ~all(cDirichletBD(x,y,elmatbnd(i,:)))
        bbcelem = dist/factorial(topologybnd)*Gc4;
    end
    if ~all(pDirichletBD(x,y,elmatbnd(i,:)))
        bbelem = dist/factorial(topologybnd)*Gs4;
    end
end