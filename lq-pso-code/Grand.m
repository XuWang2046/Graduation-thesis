function TD=Grand(fn,X,bc,D)  %XÎªµ¥µã
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
TD=zeros(1,D); 
fit1= csfun( fn,D,X);
for i=1:D
    TX=X;
    TX(i)=TX(i)+bc;
     fit2= csfun( fn,D,TX);
     TD(i)=(fit2-fit1)/bc;
end
     %TD=TD/norm(TD);

end

