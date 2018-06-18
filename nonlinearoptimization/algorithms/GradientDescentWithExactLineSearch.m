%% Gradiente Descendente com Busca Exata
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
        %% Passo 1 - Determina a dire��o do gradiente da fun��o
        direcao = -vpa(subs(grad,[x1,x2],x));
        
        %% Passo 2 - Busca Linha Exata
        t = Exact(fx, x, direcao);
        passos(contaIter,:) = x ;
        
        %% Passo 3 - Atualiza��o ->  X = X + T*(DeltaX) 
        x = x + t * direcao;
        contaIter = contaIter + 1;
        
    end
    
    %% Dados e plotagem
    Iteracoes = 1:contaIter-1;
    Tabela = table(Iteracoes', passos);
    disp(Tabela);
    disp('Valor �timo:');
    disp(x);   
    Plotar(fx, passos);    