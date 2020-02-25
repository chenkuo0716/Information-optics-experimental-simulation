function [result1,result2]=filt(g) 
[N1,N2]=size(g); 
n=2; 
d0=50; 
n1=fix(N1/2); 
n2=fix(N2/2); 
for i=1:N1 
      for j=2:N2 
          d=sqrt((i-n1)^2+(j-n2)^2);  
          if d==0 
              h=0; 
          else 
            h=1/(1+0.414*(d0/d)^(2*n)); 
           end 
          result1(i,j)=h*g(i,j); 
          if(g(i,j)<50) 
              result2(i,j)=0; 
          else 
              result2(i,j)=g(i,j); 
          end 
      end 
  end 
