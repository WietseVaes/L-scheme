viscosity = 1;
%% Stating test solutions of pressure, concentration, diffusion coefficient and permeability
p = zeros(n,nT);
c = zeros(n,nT);

%% p = (1-x)sin(y), c = t(x-1)cos(y), k = sin(x+y)(1-c)/2+1, D = (x+y)^2
csol = sin(t).*(x-1).*cos(y)/2;
Dtcsol = cos(t).*(x-1).*cos(y)/2;
Dxcsol = sin(t).*cos(y)/2;
Dxxcsol = (x+t).^0-1;
Dycsol = -sin(t).*(x-1).*sin(y)/2;
Dyycsol = -sin(t).*(x-1).*cos(y)/2;

c(:,1) = csol(:,1);

switch  perm_type
    case 'constant'

        permeability = (x+y+t+csol).^0;
        Dxpermeability = (x+y+t+csol).^0-1;
        Dypermeability = (x+y+t+csol).^0-1;
        Lk = 0;
    case  'simple'

        permeability = (x+y+t).^0 + csol.^2;
        Dxpermeability = (x+y+t).^0-1 + csol.*Dxcsol;
        Dypermeability = (x+y+t).^0-1 + csol.*Dycsol;
        Lk = 2;
    case 'bad Lipschitz'

        epsi = 1e-2;
        permeability = (x+y+t).^0 + sqrt(epsi^2+abs(csol));
        Dxpermeability = (x+y+t).^0-1 + sign(csol)./(2.*sqrt(epsi^2+abs(csol))).*Dxcsol;
        Dypermeability = (x+y+t).^0-1 + sign(csol)./(2.*sqrt(epsi^2+abs(csol))).*Dycsol;
        Lk = 1/(2*epsi);

    case 'bad minimum'

        epsi = 1e-4;
        permeability = epsi + (x+y+t).^0 - 1 + (1-csol).^2;
        Dxpermeability = (x+y+t).^0-1 + 2*(1-csol).*Dxcsol;
        Dypermeability = (x+y+t).^0-1 + 2*(1-csol).*Dycsol;
        Lk = 2;

    case 'bad all'


        epsi = 1e-2;
        permeability = (x+y+t).^0 - 1 + sqrt(epsi^2+abs(csol));
        Dxpermeability = (x+y+t).^0-1 + sign(csol)./(2.*sqrt(epsi^2+abs(csol))).*Dxcsol;
        Dypermeability = (x+y+t).^0-1 + sign(csol)./(2.*sqrt(epsi^2+abs(csol))).*Dycsol;
        Lk = 1/(2*epsi);


    case 'bad all spatial'
        epsi = 1e-2;
        permeability = (x+y+t).^0 - 1 + sqrt(epsi^2+abs(csol));
        Dxpermeability = (x+y+t).^0-1 + csol./(2*abs(csol).*sqrt(epsi^2+abs(csol))).*Dxcsol;
        Dypermeability = (x+y+t).^0-1 + csol./(2*abs(csol).*sqrt(epsi^2+abs(csol))).*Dycsol;
        Lk = 1/(2*epsi);
end


D = (x+y+t).^0;
DxD = (x+y+t).^0-1;
DyD = DxD;
%}

%{
Random_perm % Make random field of permeability.
Dxpermeability = 0*permeability;
Dypermeability = permeability*0;
DxD = D*0;
DyD = D*0;
%}

psol = (1-x).*sin(y)+t.^0-1;
Dxpsol = -sin(y)+t.^0-1;
Dxxpsol = (x+t).^0-1;
Dypsol = (1-x).*cos(y)+t.^0-1;
Dyypsol = -(1-x).*sin(y)+t.^0-1;

vxsol = -permeability/viscosity.*Dxpsol;
vysol = -permeability/viscosity.*Dypsol;

%% Constant parameters

nT = round(Tmax/Deltat)+1;

Mk = max(max(permeability));
mD = min(min(D));
Mp = max(max(max(abs(Dxpsol))),max(max(abs(Dypsol))));
Mccoef = max(max(abs(csol)));

%% Stating the functions of PDE's
%Pressure
f =  -(Dxpermeability/viscosity.*Dxpsol+permeability/viscosity.*Dxxpsol+Dypermeability/viscosity.*Dypsol+permeability/viscosity.*Dyypsol);
g1 = vxsol;
g2 = -vxsol;
g3 = vysol;
g4 = -vysol;
gsource = (x+t).^0-1; % = 0
h =  psol;

%Concentration
divvc = f.*csol-(permeability/viscosity.*Dxpsol.*Dxcsol+permeability/viscosity.*Dypsol.*Dycsol);
divDnablac = DxD.*Dxcsol+D.*Dxxcsol+DyD.*Dycsol+D.*Dyycsol;
fc = Dtcsol + divvc - divDnablac;
gc1 = (vxsol.*csol-D.*Dxcsol);
gc2 = -(vxsol.*csol-D.*Dxcsol);
gc3 = (vysol.*csol-D.*Dycsol);
gc4 = -(vysol.*csol-D.*Dycsol);
gcsource = (x+t).^0-1; % = 0
hc = csol;
%}


%% Getting the indices of where the dirichlet boundary conditions hold
IndicesN = [];
indices = [];

for index1 = 1:length(x)
    if pDirichletBD(x,y,index1) %Tests if it lays on the chosen dirichlet boundary for p.
        IndicesN = [IndicesN,index1];
    else
        indices = [indices, index1];
    end
end

IndicesNc = [];
indicesc = [];
for index1 = 1:length(x)
    if cDirichletBD(x,y,index1) %Tests if it lays on the chosen dirichlet boundary for c.
        IndicesNc = [IndicesNc; index1];
    else
        indicesc = [indicesc, index1];
    end
end

%% Putting in the used diffusion coefficient and permeability (without exact solution of c)
D = (x+y+t).^0;

switch  perm_type
    case 'constant'

        permeability(:,1) = (x+y+t(1)+c(:,1)).^0;

    case  'simple'

        permeability(:,1) = (x+y+t(1)).^0 + c(:,1).^2;

    case 'bad Lipschitz'
        epsi = 1e-2;
        permeability(:,1) = (x+y+t(1)).^0  + sqrt(epsi^2+abs(c(:,1)));


    case 'bad minimum'
        epsi = 1e-4;
        permeability(:,1) = epsi + (x+y+t(1)).^0 - 1 + (1-c(:,1)).^2;


    case 'bad all'
        epsi = 1e-2;
        permeability(:,1) = (x+y+t(1)).^0 - 1 + sqrt(epsi^2+abs(c(:,1)));


    case 'bad all spatial'
        epsi = 1e-2;
        permeability(:,1) = (x+y+t(1)).^0 - 1 + sqrt(epsi^2+abs(c(:,1)));
end
