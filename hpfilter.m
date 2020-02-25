function H=hpfilter(type,M,N,D0) 
 if nargin==4 
    n=1; 
  end 
  Hlp=lpfilter(type,M,N,D0) 
  H=1-Hlp; 