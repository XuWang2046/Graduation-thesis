function   pso_test_SECOND_PAPER( )
 
    global N; global xmax;global xmin;global vmax;global vmin;
    global D;global X;global V;global Pbest;global Gbest;global Pfit;
    global Gfit;global itermax;  global fitness;
    
    close all
    N=20;  D=20;  fn=6;   itermax=2000;

    [N, xmax, xmin, vmax,vmin, D, X, V, Pbest, Gbest, Pfit, Gfit, itermax, fitness]=init(N,D); 
    opti_fun=[0,0,0,0,-1,-176.1376,0,0,0];
    fit_iter=ones(1,itermax)*1000;

    % close all;
      X1=X;V1=V;
      [Gbest,fit_iter1,div_all1]=NDPSO(fn,X1,V1,N,D,itermax,fit_iter); 
      show_res('NDPSO',1,fit_iter1, opti_fun,fn,div_all1 );
      [Pbest,Gbest,Pfit,Gfit]=reini();

      X2=X;V2=V;
      [Gbest2,fit_iter2,div_all2]=ARPSO(fn,X2,V2,N,D,itermax,fit_iter);
      
      show_res('ARPSO',2,fit_iter2, opti_fun,fn,div_all2 );
      [Pbest,Gbest,Pfit,Gfit]=reini();

      X3=X;V3=V;
      [Gbest3,fit_iter3,div_all3]=WPSO_LQ(fn,X2,V2,N,D,itermax,fit_iter);
      % [Gbest,fit_iter,div_all]=PSO(fn,X,V,N,D,itermax,fit_iter);
      
      show_res('ADPSO',3,fit_iter3, opti_fun,fn,div_all3 );
      [Pbest,Gbest,Pfit,Gfit]=reini();

      X4=X;V4=V;
      [Gbest,fit_iter4,div_all4]=APSO(fn,X4,V4,N,D,itermax,fit_iter); 
      show_res('PSO',4,fit_iter4, opti_fun,fn,div_all4 );
      [Pbest,Gbest,Pfit,Gfit]=reini();

      figure(1)
      legend('NDPSO','ARPSO','ADPSO','WPSO')

end

function show_res(name,kk,fit_iter1, opti_fun,fn,div_all )
    col=['r','g','b','k']
        fit_iter_abs_zc1=abs(fit_iter1-opti_fun(fn));
        fit_iter_log1=log10(fit_iter_abs_zc1);

        figure(1)
        plot(fit_iter_log1,col(kk))

        hold on 
         disp([name, ': '])
         min((fit_iter_abs_zc1))


        figure(2)
        plot(div_all )

     hold on
end

function [Pbest,Gbest,Pfit,Gfit]=reini()
    global N;   global D;

     Pbest=zeros(N,D);    % 个体历史最优解 
     Gbest=zeros(1,D);    % 全局最优解
     Pfit=ones(N,1)*1000;         %个体历史最好点的fitness
     Gfit=1000;                       %全局最优点的fitness
end
 
