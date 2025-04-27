function [xi,vi]=check_x_v(xi,vi ,D,xmax)
    for i=1:D
        if abs(xi(i))>xmax 
            xi(i)=2*rand()*xmax-xmax/2 ;
        end
         if abs(vi(i))>xmax/2 
            vi(i)=rand() *xmax -xmax/2 ;
       end
    end
end