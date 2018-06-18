%% Descida mais �ngreme com Busca Backtracking
% Otimiza��o N�o Linear de Sistemas
% Docente: Daniel Alencar
% Discentes: Carlos Estev�o e Ramiro

%% Limpar dados 
    clc
    clear
    format long

%% Inicializa��o das vari�veis e fun��es
    % Vari�veis simb�licas
    syms x1 x2;
    
    % Fun��o
    fx = @(x1, x2) exp(x1 + 3*x2 - 0.1) + exp(x1 - 3*x2 - 0.1)+ exp(-x1 - 0.1);
    
    % Chute inicial    
    x0 = randn(1, 2);

    % Toler�ncia
    n = 10^(-2);
    
    % M�ximo de itera��es
    MaxIte = 1000;    
       
    % Verifica em que itera��o convergiu
    contaIter = 1;
   
    % x recebe o chute inicial
    x = x0;
    
    % Acumula os passos
    passos = [];
    
    %% C�lculo do Gradiente 
    grad = [diff(fx,x1) diff(fx,x2)];
    
    % Defini��o da dire��o
    direcao =  -vpa(subs(grad,[x1,x2],x));

%% In�cio do algoritmo
    while ((norm(direcao) >= n) && (contaIter <= MaxIte))
        %% Passo 1 - Calcula a dire��o da descida mais �ngreme
        direcao = vpa(subs(grad,[x1,x2],x));        
        [~,i] = max(abs(direcao));
        Delta_x = zeros(size(x));
        Delta_x(i) = -direcao(i); 
        
        %% Passo 2 - Busca BackTracking
        t = Backtrack(fx, x, Delta_x, direcao);
        nPasso = norm(direcao);
        passos = [passos;x];
        
        %% Passo 3 - Atualiza��o ->  X = X + T*(DeltaXsd) 
        x = x + t*Delta_x;
        contaIter = contaIter + 1;
    end
    
    %% Dados e plotagem
    Iteracoes = 1:contaIter-1;
    Tabela = table(Iteracoes', passos);
    disp(Tabela);
    disp('Valor �timo:');
    disp(x);   
    Plotar(fx, passos);    