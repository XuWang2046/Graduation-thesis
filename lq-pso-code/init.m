
function [N, xmax, xmin, vmax,vmin, D, X, V, Pbest, Gbest, Pfit, Gfit, itermax, fitness]=init(N,D)
     global xmax;global xmin;global vmax;global vmin;
     global X;global V;global Pbest;global Gbest;global Pfit;
    global Gfit;global itermax;global fitness;
 
    xmax=100;xmin=-1*xmax;
    vmax=xmax/2; vmin=-1*vmax;

    X=2*rand(N,D)  *xmax -vmax;   V=rand(N,D)*xmax-vmax;%*vmax/4;


    Pbest=zeros(N,D);    % 个体历史最优解 
    Gbest=zeros(1,D);    % 全局最优解
    Pfit=ones(N,1)*1000;         %个体历史最好点的fitness
    Gfit=1000;                       %全局最优点的fitness

    
   
    global div_all;div_all=zeros(1,itermax);

   
    fitness=zeros(1,N);
    
end