
function [Gbest,fit_iter,div_all]=PSO(fn,X,V,N,D,itmax,fit_iter)
 global fitness;global Pbest;global Gbest;global Pfit;global Gfit;
 
 
it=1;dir=1;
while it<=itmax 
    fitness=update_fit(fn,N,D,X,fitness);
 
    [Pbest,Gbest,Pfit,Gfit]=update_pbest_gbest(N,X,fitness,Pbest,Gbest,Pfit,Gfit);
    
    [X,V,DIV]=update_X_V_pso(N,X,V ,Gbest );
    div_all(it)=DIV;
    fit_iter(it)=Gfit;
    
    
    it=it+1;
end

end
   
function [X,V, DIV]=update_X_V_pso(N,X,V ,Gbest)
c1=2.0;
c2=2.0;
global Pbest;
 
global xmax;
global D;
  
     for i=1:N
       
         V(i,:)= V(i,:)+(c1*rand()*(Pbest(i,:)-X(i,:))+c2*rand()*(Gbest-X(i,:))) ;
         
         X(i,:)=X(i,:)+V(i,:);
         
         [X(i,:),V(i,:)]=check_x_v(X(i,:),V(i,:) ,D,xmax);
     end
     
     DIV=diversity(X,xmax);
   
end