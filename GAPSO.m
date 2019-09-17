clc
clear
close all
format shortG

%% parameters setting

m=input('Number of Levels(5,7,9,11)=');

nvar=(m-1)/2;

lb.var=0*ones(1,nvar);
ub.var=90*ones(1,nvar);

lb.v=0;
ub.v=90;


popsize=500;
maxiter=100;

pc=0.9;
ncross=2*round((popsize*pc)/2);

pm=1-pc;
nmut=round(popsize*pm);

W=1;
C1=2;
C2=2;

W_RF=0.97;

%% initial population algorithm
tic

emp.var=[];
emp.fit=[];
emp.v=[];

pop=repmat(emp,popsize,1);


for i=1:popsize
  
    pop(i).var=lb.var+rand(1,nvar).*(ub.var-lb.var);
    pop(i).fit=fitness(pop(i).var);
    pop(i).v=0;
    
end

[value,index]=min([pop.fit]);
gpop=pop(index);

bpop=pop;





%% main loop algorithm

BEST=zeros(maxiter,1);

for iter=1:maxiter

    % PSO
    PSOpop=PSOfunc(pop,bpop,W,C1,C2,nvar,lb,ub);
    
    
    
   % crossover
   crosspop=repmat(emp,ncross,1);
   crosspop=crossover(crosspop,pop,ncross);
   
   
   % mutation
   mutpop=repmat(emp,nmut,1);   
   mutpop=mutation(mutpop,pop,nvar,nmut,popsize,lb,ub);
   
   
   [pop]=[pop;PSOpop;crosspop;mutpop]; 
   
   [value,index]=sort([pop.fit]); 
   pop=pop(index);
   gpop=pop(1);
   pop=pop(1:popsize); 
    
   
BEST(iter)=gpop.fit;

disp([' Iter = ' num2str(iter)  ' BEST = ' num2str(BEST(iter))])


W=W*W_RF;


end


%% results algorithm

disp([ ' Best Solution = '  num2str(gpop.var)])
disp([ ' Best Fitness = '  num2str(gpop.fit)])
disp([ ' Time = '  num2str(toc)])


figure(1)
plot(BEST,'r')
xlabel('Iteration')
ylabel('Fitness')
legend('BEST')
title('GAPSO')










