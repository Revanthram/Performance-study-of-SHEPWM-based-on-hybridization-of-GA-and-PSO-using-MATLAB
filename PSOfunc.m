function par=PSOfunc(par,bpar,W,C1,C2,nvar,lb,ub)

[~,ind]=min([par.fit]);
gpar=par(ind);

Npar=length(par);


    
for i=1:Npar 

  % Update Velocity
  par(i).v=W*par(i).v+...
           C1*rand(1,nvar).*(bpar(i).var-par(i).var)+...
           C2*rand(1,nvar).*(gpar.var-par(i).var);
       
 par(i).v=CB(par(i).v,lb.v,ub.v);

 % Update Position
  
  par(i).var=par(i).var+par(i).v;
  par(i).var=CB(par(i).var,lb.var,ub.var);
  
  % Cal FItness
  par(i).fit=fitness(par(i).var);
  
  
  % Update gpar and bpar
  
  if par(i).fit
  end
end
      