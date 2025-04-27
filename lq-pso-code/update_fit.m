
function fitness=update_fit(fn,N,D,X,fitness)
        for i=1:N
            fitness(i)= csfun(  fn,D,X(i,:) );
        end
end
