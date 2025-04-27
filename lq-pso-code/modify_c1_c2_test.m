function [c1,c2]=modify_c1_c2_test( )
it_converge=1; af=0.005;

c1=[];
c2=[];
for it_current=1:1000
    
if it_converge<=it_current && it_current<=it_converge+1/(2*af)
    ct=2+cos(af*pi*(it_current-it_converge-1));
    c1=[c1,ct];
    ct=1+sin(af*pi*(it_current-it_converge-1));
    c2=[c2,ct];
elseif it_current>=it_converge+1/(2*af)
    c2=2;
    c1=2;
    c2=[c2,2];
    c1=[c1,2];
end

plot(c1)
hold on
plot(c2,'b')
end
    

end