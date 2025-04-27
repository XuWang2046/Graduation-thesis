function res= csfun(  fn,D,x )
switch fn
    case 1     % f1: n 维
        tt=0;
        for i=1:D
            tt=tt+x(i)^2;
        end
        
    case 2     %x=[1,1]
        tt=0;
        for i=2:D
            tt=tt+100*(x(i)-x(i-1)^2)^2+(1-x(i))^2 ;
        end
        
    case 3
        tt=0; %x=[0,0]
        for i=1:D
            tt=tt+x(i)^2-10*cos(2*pi*x(i))+10;
        end
        
    case 4
        t1=0;
        t2=1;
        for i=1:D
            t1=t1+x(i)^2;
            t2=t2*cos(x(i)/sqrt(i));
        end
        tt=1+t1/4000-t2;      %x=[0,0]
        
    case 5
%         x=[0,0];    %最优解
%         tt=-0.5+(sin(sqrt(x(1)^2+x(2)^2))-0.5)/(1+0.001*(x(1)^2+x(2)^2))^2;
        p1=(sin(sqrt(x(1)^2+x(2)^2))^2-0.5)/(1+0.001*(x(1)^2+x(2)^2))^2;
        p2=0.5;
        tt=p1-p2;
    case 6
%     x=[-1.3068,-1.4248];   %最优解
        tt=(x(1)+1.42513)^2+(x(2)+0.80032)^2;
        t1=0;
        t2=0;
        
        for i=1:5
            t1=t1+i*cos((i-1)*x(1)+i);
            t2=t2+i*cos((i+1)*x(2)+i);
        end
        
        tt=tt+t1*t2;
    case 7  
        tt=0;
       t2=1;
        for i=1:D
            tt=tt+abs(x(i));
            t2=t2*abs(x(i));
        end
    case 8
        tt=0;
        for i=1:D
            tt=tt+abs(x(i)*sin(x(i))+0.1*x(i));
        end
    case 9
        tt=418.9829*D;
        for i=1:D
            tt=tt-x(i)*sin(sqrt(abs(x(i))));
        end
end
res=tt;
end
    
        

 

