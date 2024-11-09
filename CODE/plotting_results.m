clear all
clf
% load('constant k.mat')
load('nice permeability.mat')
% load('bad Lipschitz.mat')
% load('bad minimal.mat')
% load('bad all.mat')
T = max(t);
figure(1); hold on;
colors = {'g','b','r','k','y'};
for i1 = 1:length(counter)
    counts = counter{i1};
    tt = linspace(0,T,length(counts)+1); tt(1) = []; 
    plot(tt, counts,colors{i1},'LineWidth',2);
    yline(countermean(i1),'Color',colors{i1}, 'LineWidth',2)
end
yticks(unique(countermean))
h = legend('dt = 1e-6','','dt = 1e-5','','dt = 1e-4','','dt = 1e-3','','dt = 1e-2','', 'Location','northwest');
 set(h,'FontSize',12);
hold off;