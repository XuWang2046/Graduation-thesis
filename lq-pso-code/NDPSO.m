
function [Gbest,fit_iter,div_all]=NDPSO(fn,X,V,N,D,itmax,fit_iter)
 global fitness;global Pbest;global Gbest;global Pfit;global Gfit;
 dH=0.5;dL=5e-4; 
 
it=1;dir=1;
while it<=itmax 
    fitness=update_fit(fn,N,D,X,fitness);
 
    [Pbest,Gbest,Pfit,Gfit]=update_pbest_gbest(N,X,fitness,Pbest,Gbest,Pfit,Gfit);
    
    [X,V,DIV]=update_X_V_nd(N,X,V,dH,dL,it,itmax,Pfit);
    div_all(it)=DIV;
    fit_iter(it)=Gfit;
    
    
    it=it+1;
end

end
   
function [X,V, DIV]=update_X_V_nd(N,X,V,dH,dL,it,itmax,Pfit)
c1=2.0;
c2=2.0;
global Pbest;
global Gbest;
global xmax;
global D;
 wm=0.9;wmin=0.4;sita=0.4433;
 meanfitness=mean(Pfit);
%  w=wm-it*(wm-wmin)/itmax;
 w=wmin+(wm-wmin)*(-exp(it/itmax)^2)/(sqrt(2*pi))*sita;
 
     for i=1:N
         LMTA=1/(1+exp(-(Pfit(i))/(meanfitness)));
         V(i,:)=w*V(i,:)+(c1*rand()*(Pbest(i,:)-X(i,:))+c2*rand()*(Gbest-X(i,:))) ;
         
         X(i,:)=X(i,:)+LMTA*V(i,:);
         
         [X(i,:),V(i,:)]=check_x_v(X(i,:),V(i,:) ,D,xmax);
     end
     
     DIV=diversity(X,xmax);
   
end