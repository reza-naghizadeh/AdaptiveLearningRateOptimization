function [learningRate] = GOLD(x, f)
    % The function
    syms x1 x2;
    f(x1, x2) = f;
    
    % Making a list for learning rates
    lr = 0.00001:0.001:1;
    
    c1 = 0.2;
    
    % Compute the grdient
    gradi = double(subs(gradient(f, [x1, x2]),{x1,x2},{x(1,1),x(1,2)}));
    p = -gradi;
    
    for i = 1:length(lr)
        
        % Compute the next ppoint
        xap = x + lr(i) * transpose(p);
        % Compute the gradient 
        fxi = double(subs(f(x(1,1),x(1,2)),{x1,x2},{x(1,1),x(1,2)}));
        
        % Conditions
        con1 = fxi + (1 - c1) * lr(i) * transpose(gradi) * p ;
        con2 = double(subs(f(xap(1,1), xap(1,2)),{x1,x2},{xap(1,1), xap(1,2)}));
        con3 = fxi + c1 * lr(i) * transpose(gradi) * p;
        
        % Break condition
        if (con1 <= con2 && con2 <= con3)
            % return the learning rate 
            learningRate = lr(i);
            break
        end
    end   
end