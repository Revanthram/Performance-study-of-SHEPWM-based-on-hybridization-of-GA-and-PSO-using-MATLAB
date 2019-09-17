function Z=fitness(x)
s=length(x);
%%
%for 5 level
if (s==2)
    
    v5=abs((sum(cosd(5*x))))/5;
% sorting
    if (x(1) >= x(2))
             v5 = v5 + 999;
           
    end
    
    v=v5;

    Z=100*(abs(0.8-(abs(sum(cosd(x))))/2)+v/2);
end
%%
%for 7 level
if (s==3)
    
    v5=abs((sum(cosd(5*x))))/5;
    v7=abs((sum(cosd(7*x))))/7;
    
%sorting    
    if (x(1) >= x(2)) || (x(1) >= x(3))
            v5 = v5 + 999;
            v7 = v7 + 999;
    end
        if (x(2) >= x(3))
            v5 = v5 + 999;
            v7 = v7 + 999;
        end

    v=v5+v7;

    Z=100*(abs(0.8-(abs(sum(cosd(x))))/3)+v/3);
end
%%
%for 9 level
if (s==4)
    
    v5=abs((sum(cosd(5*x))))/5;
    v7=abs((sum(cosd(7*x))))/7;
    v11=abs((sum(cosd(11*x))))/11;
    
    %sorting
    if (x(1) >= x(2)) || (x(1) >= x(3)) || (x(1) >= x(4))
            v5 = v5 + 999;
            v7 = v7 + 999;
            v11 = v11 + 999; 
    end
        if (x(2) >= x(3)) || (x(2) >= x(4)) 
            v5 = v5 + 999;
            v7 = v7 + 999;
            v11 = v11 + 999; 
        end
        if (x(3) >= x(4))
            v5 = v5 + 999;
            v7 = v7 + 999;
            v11 = v11 + 999;
        end

    v=v5+v7+v11;

    Z=100*(abs(0.8-(abs(sum(cosd(x))))/4)+v/4);
end
%%
%for 11 level
if(s==5)

    
    v5=abs((sum(cosd(5*x))))/5;
    v7=abs((sum(cosd(7*x))))/7;
    v11=abs((sum(cosd(11*x))))/11;
    v13=abs((sum(cosd(13*x))))/13;
    %sorting
    if (x(1) >= x(2)) || (x(1) >= x(3)) || (x(1) >= x(4)) || (x(1) >= x(5))
            v5 = v5 + 999;
            v7 = v7 + 999;
            v11 = v11 + 999;
            v13 = v13 + 999;
    end
        if (x(2) >= x(3)) || (x(2) >= x(4)) || (x(2) >= x(5))
            v5 = v5 + 999;
            v7 = v7 + 999;
            v11 = v11 + 999;
            v13 = v13 + 999;
        end
        if (x(3) >= x(4)) || (x(3) >= x(5))
            v5 = v5 + 999;
            v7 = v7 + 999;
            v11 = v11 + 999;
            v13 = v13 + 999;
        end
        if (x(4) >= x(5))
            v5 = v5 + 999;
            v7 = v7 + 999;
            v11 = v11 + 999;
            v13 = v13 + 999;
        end
         v=v5+v7+v11+v13;

    Z=100*(abs(0.8-(abs(sum(cosd(x))))/5)+v/5);
end

end
