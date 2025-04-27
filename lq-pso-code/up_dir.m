function up_dir(x)
x=[0:0.01:1];
ll=length(x);
for i=1:ll
y(i)=-(1/10)^(x(i)-1) ;

end
plot(y)
end