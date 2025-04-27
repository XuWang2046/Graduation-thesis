
function [Gbest,fit_iter,div_all]=WPSO_LQ(fn,X,V,N,D,itmax,fit_iter)
 global fitness;global Pbest;global Gbest;global Pfit;global Gfit;
 dH=0.25;dL=5e-6; 
  af=0.005;
it=1;dir=1;
flag_converge=0;
it_converge=0;
c1=2;c2=2;
while it<=itmax 
    fitness=update_fit(fn,N,D,X,fitness);
 
    [Pbest,Gbest,Pfit,Gfit]=update_pbest_gbest(N,X,fitness,Pbest,Gbest,Pfit,Gfit);
    
    [X,V,DIV,dir]=update_X_V_AR(fn,N,X,V,dH,dL,dir,it,itmax,c1,c2);
    div_all(it)=DIV;
    fit_iter(it)=Gfit;
    
    if flag_converge==0 &&DIV<0.001
         flag_converge=1;
         it_converge=it;
         X=(rand(N,D)-0.5)*200; 
         disp('converge')
      
    end
   
    if flag_converge==1&& it<it_converge+1/(2*af)
%         [it_converge,it]
        [c1,c2]=modify_c1_c2(it_converge,it,af);
    else
        flag_converge=0;
        c1=2;c2=2;
    end
        
    it=it+1;
end

end
   

function [X,V, DIV,dir]=update_X_V_AR(fn,N,X,V,dH,dL,dir,it,itmax,c1,c2)

global Pbest;
global Gbest;
global xmax;
global D;
 wm=0.9;wmin=0.4;
 w=wm-it*(wm-wmin)/itmax;
%  px=randperm(N);

     for i=1:N

         V(i,:)=w*V(i,:)+(c1*rand()*(Pbest(i,:)-X(i,:))+c2*rand()*(Gbest-X(i,:)))*1;%-2*rand()*TD/norm(TD);
         X(i,:)=X(i,:)+V(i,:);
         xp=X(i,:);
         X(i,:)=ptd(X(i,:),fn,D,0.001);

         [X(i,:),V(i,:)]=check_x_v(X(i,:),V(i,:) ,D,xmax);
         
         
     end
     DIV=diversity(X,xmax);
 

end
function RES=ptd(Xi,fn,D,BT)
    index_ptd=randi([1 D]);
   
    Xi_T1=Xi ;Xi_T2=Xi;
    Xi_T1(index_ptd)=Xi(index_ptd)+BT ;
    Xi_T2(index_ptd)=Xi(index_ptd)-BT ;

    JIE=[Xi_T1;Xi_T2;Xi] ;
    f1= csfun(  fn,D,Xi_T1 );
    f2= csfun(  fn,D,Xi_T2 );
    FORI=csfun(  fn,D,Xi );
 
    [A,ITH]=min([f1,f2,FORI]);
    RES=JIE(ITH,:) ;
    
   

end

function [c1,c2]=modify_c1_c2(it_converge,it_current,af)

if it_converge<=it_current && it_current<=it_converge+1/(2*af)
    c1=2+cos(af*pi*(it_current-it_converge-1));
    c2=1+sin(af*pi*(it_current-it_converge-1));
elseif it_current>=it_converge+1/(2*af)
    c2=2;
    c1=2;
end
    

end
