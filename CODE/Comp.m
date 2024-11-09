j = 1; Build_ind; Build_tdep; %First timestep (j) loading time and concentration independant matrices/vectors and time dependant for time 1

Comp_p %Computing pressure

%True/False statement for if current iterations exceeds minimal amount of iterations
TF = 0;
maxcounter = 300;
for j = 2 : nT
    if TF %Check if these L1 and L2 are doing worse than the ones of minimal iterations
        break
    end
    Parameters_tdep; Build_tdep %Loads time dependant parameters and build time dependant matrices/vectors

    cold = c(:,j-1); c(:,j) = c(:,j-1); %states starting point for iterations.
    pold = p(:,j-1); p(:,j) = p(:,j-1); %states starting point for iterations.

    % cold = rand(size(c,1),1); c(:,j) = rand(size(c,1),1); %random startpoint
    % pold = rand(size(p,1),1); p(:,j) = rand(size(p,1),1); %random startpoint

    while ((L2norm(c(:,j)-cold,elmat,x,y,"none") + L2norm(p(:,j)-pold,elmat,x,y,"grad")>= TOL * h_spacing) || counter{Lindex1}(j-1)==0 ) && counter{Lindex1}(j-1) <= maxcounter%in functie van Delta x (stapgrootte) zetten. (gescaald) 
    %while ((L2norm(c(:,j)-cold,elmat,x,y,"none") + L2norm(p(:,j)-pold,elmat,x,y,"grad")>= TOL * h_spacing*sqrt(Deltat)) || counter{Lindex1,Lindex2}(j-1)==0 ) && counter{Lindex1,Lindex2}(j-1) <= maxcounter%in functie van Delta x (stapgrootte) zetten. (gescaald) 
        % if counter{Lindex1,Lindex2}(j-1)>=mincounter(j-1) %Checks if these L1 and L2 are doing worse than the ones of minimal iterations
        %     TF = 1;
        %     break
        % end
        %piterations{j-1}(:,counter{Lindex1,Lindex2}(j-1)+1) = p(:,j);
        %citerations{j-1}(:,counter{Lindex1,Lindex2}(j-1)+1) = c(:,j);
        piterations{j-1}(:,counter{Lindex1}(j-1)+1) = p(:,j);
        citerations{j-1}(:,counter{Lindex1}(j-1)+1) = c(:,j);
        cold = c(:,j);pold = p(:,j); %Updating cold and pold to the ones who will be old after this iteration

        Parameters_kdep; Build_S; %Loads permeability dependant parameters and builds the S matrix (k dependant matrix)
        %If permeability and diffusion random, disable 'Parameters_kdep'

        Comp_p; Build_V; %Computes pressure and builds the V matrix (p dependant matrix)

        Comp_c; %Computes concentration

        %counter{Lindex1,Lindex2}(j-1) = counter{Lindex1,Lindex2}(j-1) + 1; %Adds to counter of iterations
         counter{Lindex1}(j-1) = counter{Lindex1}(j-1) + 1; %Adds to counter of iterations


    end
    % piterations{j-1}(:,counter{Lindex1,Lindex2}(j-1)+1) = p(:,j);
    % citerations{j-1}(:,counter{Lindex1,Lindex2}(j-1)+1) = c(:,j);
    piterations{j-1}(:,counter{Lindex1}(j-1)+1) = p(:,j);
    citerations{j-1}(:,counter{Lindex1}(j-1)+1) = c(:,j);
end
