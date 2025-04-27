function gs_pso()
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
N=20;
D=20;
fn=1;  
xmax=100;xmin=-1*xmax;
vmax=xmax/2; vmin=-1*vmax;

X=2*rand(N,D)  *xmax -vmax;  
V=rand(N,D)*xmax-vmax;%*vmax/4;

itmax=1000;
af=1;
MINFIT=10000;
for it=1:itmax
    X=2*rand(N,D)  *xmax -vmax;  
    for i=1:N
               
               TD=Grand(fn,X(i,:),0.01,D); 
               X1=X(i,:)- TD*af;
   
               fit1= csfun( fn,D,X(i,:));
               fit2= csfun( fn,D,X1);
               while fit1>fit2
                     TD=Grand(fn, X1,0.01,D); 
                      fit1=fit2;
                      X1=X1-TD*af;
                      fit2= csfun( fn,D,X1); 
               end
               if MINFIT<fit2
                   MINFIT=fit2;
               end
              X(i,:)=X1;
    end
    

end
MINFIT
end

