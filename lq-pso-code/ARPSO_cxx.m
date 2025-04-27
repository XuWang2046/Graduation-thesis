
function [Gbest,fit_iter,div_all]=ARPSO_cxx(fn,X,V,N,D,itmax,fit_iter)
     global fitness;global Pbest;global Gbest;global Pfit;global Gfit;
     dH=0.25;dL =5e-6;
 
    it=1;dir=1;
    while it<=itmax 
        fitness=update_fit(fn,N,D,X,fitness);
     
        [Pbest,Gbest,Pfit,Gfit]=update_pbest_gbest(N,X,fitness,Pbest,Gbest,Pfit,Gfit);
         
        [X,V,DIV,dir]=update_X_V_AR(N,X,V,dH,dL,dir,it,itmax);
        div_all(it)=DIV;
        fit_iter(it)=Gfit;
        it=it+1;
    end

    end
       
    function [X,V, DIV,dir]=update_X_V_AR(N,X,V,dH,dL,dir,it,itmax)
    c1=2.0;
    c2=2.0;
    global Pbest;
    global Gbest;
    global xmax;
    global D;
     wm=0.9;wmin=0.4;
     w=wm-it*(wm-wmin)/itmax;
         for i=1:N
           
             V(i,:)=w*V(i,:)+(c1*rand()*(Pbest(i,:)-X(i,:))+c2*rand()*(Gbest-X(i,:)))*dir;
             
             X(i,:)=X(i,:)+V(i,:);
             
             [X(i,:),V(i,:)]=check_x_v(X(i,:),V(i,:) ,D,xmax);
         end
         
         DIV=diversity(X,xmax);
       [dir,V]=update_dir( DIV,dir,dL,dH,V,N,D);
        
    end
    function [dir,V]=update_dir( DIV,dir,dL,dH,V,N,D)
                  if DIV<=dL
    %                   dir=-((1/1000)^(DIV-1)+500) ;
                        dir=-20/DIV;
                        for i=1:N
                            V(i,:)=V(i,:)/norm(V(i,:));
                        end
                         V=V*50;
                  end
                    if DIV>=dH
                      dir=1;
                    end
                  
    end