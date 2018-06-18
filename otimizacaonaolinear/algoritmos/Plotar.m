%% Gradiente Descendente com Busca Backtracking
% Otimiza��o N�o Linear de Sistemas
% Docente: Daniel Alencar
% Discentes: Carlos Estev�o e Ramiro

function Plotar(f, passos)    
    fcontour(f);
    hold on
    plot(passos(:,1),passos(:,2), '*-r')   
    hold off
end