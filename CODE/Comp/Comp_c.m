
%if counter{Lindex1,Lindex2}(j-1) == 0
if counter{Lindex1}(j-1) == 0
    cc = (Mc*(1+L2) + Deltat*V + Deltat*SD) \ (Deltat*bc + Mc*c(indicesc,j-1) - Deltat*Mctilde*diffthcvec - Deltat*Vtilde*hcvec - Deltat*SDtilde*hcvec+L2*(Mc*cold(indicesc)-(Mctilde*(hcvec-hc(IndicesNc,j-1)))));
else
    cc = (Mc*(1+L2) + Deltat*V + Deltat*SD) \ (Deltat*bc + Mc*c(indicesc,j-1) - Deltat*Mctilde*diffthcvec - Deltat*Vtilde*hcvec - Deltat*SDtilde*hcvec+L2*(Mc*cold(indicesc)));
end

c(indicesc,j) = cc(:);
c(IndicesNc,j) = hcvec;
clear cc 