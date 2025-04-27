
function [Pbest,Gbest,Pfit,Gfit,fitness]=update_pbest_gbest2(N,X ,Pbest,Gbest,Pfit,Gfit)
 fitness=ones(1,N)'*10000;
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