function res = L2norm(r,elmat,x,y,string)
%% Calculate the L2 norm of the gradient of r
if string == "grad"
    res = 0;
    for i = 1:size(elmat,1)
        xc = x(elmat(i,:));
        yc = y(elmat(i,:));
        topology = size(elmat,2);
        Delta = abs(det([ones(topology,1) xc yc]));
        B_mat = [ones(topology,1) xc yc] \  eye(topology);
        restss = 0;
        for index1 = 2:topology
            restss = restss + (B_mat(index1,:)*r(elmat(i,:)))^2;
        end
        res = res + Delta*restss/factorial(topology);
    end
    res = sqrt(res);
%% Calculate the L2 norm of r
else
    res = 0;
    for i = 1:size(elmat,1)
        xc = x(elmat(i,:));
        yc = y(elmat(i,:));

        topology = size(elmat,2);
        Delta = abs(det([ones(topology,1) xc yc]));

        res = res + Delta*sum(r(elmat(i,:)).^2)/factorial(topology);
    end
    res = sqrt(res);
end