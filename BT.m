function [learningRate] = BT(x, f)
    % The function
    syms x1 x2;
    f(x1, x2) = f;
    
    % Two number between 0 and 1
    c1 = rand();
    ro = rand();
    % INITIAL NUMBER FOR LEARNING RATE
    lr = 1;
    
    % Compute the gradient
    gradi = double(subs(gradient(f, [x1, x2]),{x1,x2},{x(1,1),x(1,2)}));
    p = -gradi;
    
    % Compute the next point
    xap = x + lr * transpose(p);
    % Compute the gradient with new point
    con1 = double(subs(f(xap(1,1), xap(1,2)),{x1,x2},{xap(1,1), xap(1,2)}));
    
    % Compute the gradient with pervious point
    fxi = double(subs(f(x(1,1),x(1,2)),{x1,x2},{x(1,1),x(1,2)}));
    % Second condition using fxi
    con2 = fxi + c1 * lr * transpose(gradi) * p;
    
    while con1 >= con2
        %v Update the learning rate
        lr = lr * ro;

        % Compute the next point
        xap = x + lr * transpose(p);
        % Compute the gradient with new point
        con1 = double(subs(f(xap(1,1), xap(1,2)),{x1,x2},{xap(1,1), xap(1,2)}));
        
        % Compute the gradient with pervious point
        fxi = double(subs(f(x(1,1),x(1,2)),{x1,x2},{x(1,1),x(1,2)}));
        % Second condition using fxi
        con2 = fxi + c1 * lr * transpose(gradi) * p;
    end
    % return the learning rate 
    learningRate = lr;
end