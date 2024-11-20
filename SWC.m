function [learningRate] = SWC(x, f)
    % The function
    syms x1 x2;
    f(x1, x2) = f;
    
    % Making a list for learning rates
    lr = 0.00001:0.001:1;
    
    % C1 = a Number between 0 and 1 //// c2 = a number between c1 and 1
    c1 = rand();
    c2 = c1 + rand() * (1 - c1);
    
    % Compute the gradient
    gradi = double(subs(gradient(f) ,{x1,x2},{x(1,1),x(1,2)}));
    p = -gradi;
    
    for i = 1:length(lr)
        
        % compute the next point
        xap = x + lr(i) * transpose(p);
        
        % Conditions of Strong Wolfe Conditions
        con1 = double(subs(f,{x1,x2},{xap(1,1), xap(1,2)}));
        con2 = double(subs(f(x(1,1), x(1,2)),{x1,x2},{x(1,1),x(1,2)})) + (c1 * (lr(i) * transpose(gradi)) * p);
        con3 = abs(transpose(double(subs(gradient(f),{x1,x2},{xap(1,1),xap(1,2)}))) * p);
        con4 = c2 * abs(transpose(gradi) * p);
        
        % Break condition
        if (con1 <= con2 && con3 <= con4)
            % return the learning rate 
            learningRate = lr(i);
            break
        end
    end   
end