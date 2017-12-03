 
x = 1:1/10:10;
plot(x,sin(x))                          % tracer n'importe quelle fonction
x_tick = get(gca,'XTick')               % juste pour voir ce que donnent ces fonctions
x_tick_label = get(gca,'XTickLabel')    % (pour éventuellement les modifier à partir des valeurs)
x_tick = [1 2 4 9];                     % nouveaux placements des indicateurs
x_tick_label = {}                       % que l'on va renommer (par du texte ou des nombres)
x_tick_label{1} = 'nimporte';
x_tick_label{2} = 'quel';
x_tick_label{3} = 'texte';
x_tick_label{4} = '(ou nombre)';       % x_tick et x_tick_label doivent avoir la même taille
set(gca,'XTickLabel',x_tick_label);    % on change effectivement les indicateurs et leurs textes
set(gca,'XTick',x_tick);
xticklabel_rotate([],80)               % fonction probablement utile trouvée sur les forum Matlab (inscription nécessaire)
