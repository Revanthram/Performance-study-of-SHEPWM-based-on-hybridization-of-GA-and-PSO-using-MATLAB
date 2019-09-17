function  mutpop=mutation(mutpop,pop,nvar,nmut,popsize,lb,ub)

for n=1:nmut
    
i=randi([1 popsize]);  

p=pop(i).var;

j=randi([1 nvar]);

d=ub.var(j)-lb.var(j);
d=0.05*unifrnd(-1,1)*d;

p(j)=p(j)+d;


p=max(p,lb.var);
p=min(p,ub.var);

mutpop(n)=pop(i);
mutpop(n).var=p;
mutpop(n).fit=fitness(p);

end

end
