
function [Pbest,Gbest,Pfit,Gfit]=update_pbest_gbest(N,X,fitness,Pbest,Gbest,Pfit,Gfit)
 
for i=1:N
       if fitness(i)<Pfit(i)
           Pfit(i)=fitness(i);
           Pbest(i,:)=X(i,:);
       end
       if Pfit(i)<Gfit
           Gbest =X(i,:);
           Gfit=Pfit(i);
       end
   end
end