function  PSO_LQ()
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

N=20;
D=20;
fn=1;  
xmax=10;xmin=-1*xmax;
vmax=xmax/2; vmin=-1*vmax;

X=2*rand(N,D)  *xmax -vmax;  
V=rand(N,D)*xmax-vmax;     %*vmax/4;

Pbest=zeros(N,D);              % ������ʷ���Ž� 
Gbest=zeros(1,D);              % ȫ�����Ž�
Pfit=rand(N,1)*1000;           %������ʷ��õ��fitness
Gfit=10000;                   %ȫ�����ŵ��fitness
    
itermax=10000;

div_all=zeros(1,itermax);

   
fitness=zeros(1,N); 
opti_fun=[0,0,0,0,-1,-176.1376];
fit_iter=ones(1,itermax)*100000;
 
close all;
X1=X;V1=V;


c1=1.0;
c2=1.0; 
c3=0.1;
wm=0.9;wmin=0.4;
  
 
it=1; 
div_all=[];
 
while it<=itermax 
    
     w=wm-it*(wm-wmin)/itermax;
     
     fitness=update_fit(fn,N,D,X,fitness);
     
     [Pbest,Gbest,Pfit,Gfit]=update_pbest_gbest(N,X ,fitness,Pbest,Gbest,Pfit,Gfit);
     
     for i=1:N
        TD=Grand(fn,X(i,:),0.01,D) ;
        V(i,:)= w*V(i,:)+(c1*rand()*(Pbest(i,:)-X(i,:))+c2*rand()*(Gbest-X(i,:))) -c3*rand()*TD;
        X(i,:)=V(i,:)+X(i,:);

        for j=1:D
            if abs(X(i,j))>xmax 
                 X(i,j)=2*rand()*xmax-xmax/2 ;
           end
        end
        
     end
      
    DIV=diversity(X,xmax);  
    div_all(it)=DIV;
    fit_iter(it)=Gfit;
    it=it+1;
end
Gfit
plot(log10(fit_iter))
% figure(2)
% plot(div_all,'r')




end 
 
