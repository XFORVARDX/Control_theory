function m_eulera(X,h,N,f1,f2)
x1=[X(1)];
x2=[X(2)];
x3=[X(3)]
t=[0];
for n=1:N+1
    x1(n+1)=x1(n)+h*f1(t(n),x1(n),x2(n));
     x2(n+1)=x2(n)+h*f2(t(n),x1(n),x2(n));
     t(n+1)=t(n)+h;
end
end
