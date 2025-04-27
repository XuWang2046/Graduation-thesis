
function [Gbest,fit_iter,div_all]=ARPSO_cxx3(fn,X,V,N,D,itmax,fit_iter)
 global fitness;global Pbest;global Gbest;global Pfit;global Gfit;
 dH=0.25;dL=5e-6; 
 
it=1;dir=1;
while it<=itmax 
    fitness=update_fit(fn,N,D,X,fitness);
 
    [Pbest,Gbest,Pfit,Gfit]=update_pbest_gbest(N,X,fitness,Pbest,Gbest,Pfit,Gfit);
    
    [X,V,DIV,dir]=update_X_V_AR(fn,N,X,V,dH,dL,dir,it,itmax);
    div_all(it)=DIV;
    fit_iter(it)=Gfit;
    
    
    it=it+1;
end

end
   
function [X,V, DIV,dir]=update_X_V_AR(fn,N,X,V,dH,dL,dir,it,itmax)
c1=0.5;
c2=2.0;
global Pbest;
global Gbest;
global xmax;
global D;
 wm=0.9;wmin=0.4;
 w=wm-it*(wm-wmin)/itmax;
 px=randperm(N);
 k=20;
     for j=1:k
         i=px(j);
        TD=Grand(fn,X(i,:),0.01,D) ;
         V(i,:)=w*V(i,:)+(c1*rand()*(Pbest(i,:)-X(i,:))+c2*rand()*(Gbest-X(i,:)))*1- 0.0051*rand()*TD/norm(TD);
         %f1£¬f2£¬f4£º0.05£»
         %
         X(i,:)=X(i,:)+V(i,:);
         
         [X(i,:),V(i,:)]=check_x_v(X(i,:),V(i,:) ,D,xmax);
     end
     for j=k+1:N
         i=px(j);
 
         V(i,:)=w*V(i,:)+(c1*rand()*(Pbest(i,:)-X(i,:))+c2*rand()*(Gbest-X(i,:)))*1;%-2*rand()*TD/norm(TD);
         
         X(i,:)=X(i,:)+V(i,:);
         
         [X(i,:),V(i,:)]=check_x_v(X(i,:),V(i,:) ,D,xmax);
     end
     DIV=diversity(X,xmax);
%    
%      if DIV>dH
%              dir=1;
%      end
%      if DIV<dL
%          dir=-1 ;
%      end
end