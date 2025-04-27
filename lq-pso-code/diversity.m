function DIV=diversity(X,L)  % L:¿Õ¼ä°ë¾¶
     [m,n]=size(X);
     mean_points=repmat(mean(X),m,1);
     cx=X-mean_points;
     cx=cx.*cx;
     DIV=sum(sqrt(sum(cx')))/(m*L*sqrt(n));
     
     
end