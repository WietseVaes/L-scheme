%% Updating used permeability

%if counter{Lindex1,Lindex2}(j-1)~=0
if counter{Lindex1}(j-1)~=0
    % Constant
    %{
    permeability(:,j) = (x+y+t(1)+c(:,j)).^0;
    %}

    % Concentration dependent m_k = 1; L_k = 2
    %
    permeability(:,j) = (x+y+t(1)).^0 + c(:,j).^2;
    %}

    % Concentration dependent m_k = 1; L_k = inf
    %{
    epsi = 1e-2;
    permeability(:,j) = (x+y+t(1)).^0 + sqrt(epsi^2+abs(c(:,j)));
    %}

    % Concentration dependent m_k = 0; L_k = 2
    %{
    epsi = 1e-4;
    permeability(:,j) = epsi + (x+y+t(1)).^0 + (1-c(:,j)).^2;
    %}

    %Concentration dependent m_k = 0; L_k = inf
    %{
    epsi = 1e-2;
    permeability(:,j) = (x+y+t(1)).^0 - 1 + sqrt(epsi^2+abs(c(:,j)));
    %}

    %Concentration dependent m_k = 0; L_k = inf + spatial dependence
    %{
    epsi = 1e-2;
    permeability(:,j) = (x+y+t(1)).^0 - 1 + sqrt(epsi^2+abs(c(:,j)));
    %}


    %permeability(:,j) = sin((x+y)).*(1-c(:,j))/2+1;
else

    % Constant
    %{
    permeability(:,j) = (x+y+t(1)+c(:,j-1)).^0;
    %}

    % Concentration dependent m_k = 1; L_k = 2
    %
    permeability(:,j) = (x+y+t(1)).^0 + c(:,j-1).^2;
    %}

    % Concentration dependent m_k = 1; L_k = inf
    %{
    epsi = 1e-2;
    permeability(:,j) = (x+y+t(1)).^0 + sqrt(epsi^2+abs(c(:,j-1)));
    %}

    % Concentration dependent m_k = 0; L_k = 2
    %{
    epsi = 1e-4;
    permeability(:,j) = epsi + (x+y+t(1)).^0 + (1-c(:,j-1)).^2;
    %}

    %Concentration dependent m_k = 0; L_k = inf
    %{
    epsi = 1e-2;
    permeability(:,j) = (x+y+t(1)).^0 - 1 + sqrt(epsi^2+abs(c(:,j-1)));
    %}

    %Concentration dependent m_k = 0; L_k = inf + spatial dependence
    %{
    epsi = 1e-2;
    permeability(:,j) = (x+y+t(1)).^0 - 1 + sqrt(epsi^2+abs(c(:,j-1)));
    %}


    %permeability(:,j) = sin(x+y).*(1-c(:,j-1))/2+1;
end