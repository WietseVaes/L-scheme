%% Updating used permeability

%if counter{Lindex1,Lindex2}(j-1)~=0
if counter{Lindex1}(j-1)~=0
    switch  perm_type
        case 'constant'
            permeability(:,j) = (x+y+t(1)+c(:,j)).^0;
        case  'simple'
            permeability(:,j) = (x+y+t(1)).^0 + c(:,j).^2;
        case 'bad Lipschitz'
            epsi = 1e-2;
            permeability(:,j) = (x+y+t(1)).^0 + sqrt(epsi^2+abs(c(:,j)));
        case 'bad minimum'
            epsi = 1e-4;
            permeability(:,j) = epsi + (x+y+t(1)).^0 - 1 + (1-c(:,j)).^2;
        case 'bad all'
            epsi = 1e-2;
            permeability(:,j) = (x+y+t(1)).^0 - 1 + sqrt(epsi^2+abs(c(:,j)));
        case 'bad all spatial'
            epsi = 1e-2;
            permeability(:,j) = (x+y+t(1)).^0 - 1 + sqrt(epsi^2+abs(c(:,j)));
    end
else

    switch  perm_type
        case 'constant'
            permeability(:,j) = (x+y+t(1)+c(:,j-1)).^0;
        case  'simple'
            permeability(:,j) = (x+y+t(1)).^0 + c(:,j-1).^2;
        case 'bad Lipschitz'
            epsi = 1e-2;
            permeability(:,j) = (x+y+t(1)).^0 + sqrt(epsi^2+abs(c(:,j-1)));
        case 'bad minimum'
            epsi = 1e-4;
            permeability(:,j) = epsi + (x+y+t(1)).^0 - 1 + (1-c(:,j-1)).^2;
        case 'bad all'
            epsi = 1e-2;
            permeability(:,j) = (x+y+t(1)).^0 - 1 + sqrt(epsi^2+abs(c(:,j-1)));
        case 'bad all spatial'
            epsi = 1e-2;
            permeability(:,j) = (x+y+t(1)).^0 - 1 + sqrt(epsi^2+abs(c(:,j-1)));
    end

end