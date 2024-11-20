# AdaptiveLearningRateOptimization  

This repository provides implementations of three learning rate selection algorithms: **Backtracking Line Search (BT)**, **Golden Section Search (GOLD)**, and **Strong Wolfe Conditions (SWC)**. These methods are used to optimize the step size during gradient descent to ensure efficient convergence in optimization problems. 

These codes was developed as part of our Optimization course project at IASBS, in collaboration with my groupmate, [Erfan Faridi](https://github.com/erfanfaridii/).

## Features  

- **Backtracking Line Search (BT):** Dynamically adjusts the learning rate using a contraction factor and Armijo condition.  
- **Golden Section Search (GOLD):** Searches for the optimal learning rate within a bounded interval using bracketing conditions.  
- **Strong Wolfe Conditions (SWC):** Selects a learning rate satisfying both sufficient decrease and curvature conditions for robust optimization.  

## Code Overview  

### Functions  

1. **BT (Backtracking Line Search):**  
   - Dynamically adjusts the learning rate to satisfy the Armijo condition.  
   - Inputs:  
     - `x`: Current point in optimization.  
     - `f`: Target function.  
   - Outputs:  
     - `learningRate`: Optimized step size for the current iteration.  

2. **GOLD (Golden Section Search):**  
   - Iteratively searches for the best learning rate in a bounded interval.  
   - Inputs:  
     - `x`: Current point in optimization.  
     - `f`: Target function.  
   - Outputs:  
     - `learningRate`: Best learning rate satisfying bracketing conditions.  

3. **SWC (Strong Wolfe Conditions):**  
   - Computes a learning rate that meets both the sufficient decrease and curvature conditions.  
   - Inputs:  
     - `x`: Current point in optimization.  
     - `f`: Target function.  
   - Outputs:  
     - `learningRate`: Learning rate satisfying Strong Wolfe Conditions.  

### Usage  

These functions can be integrated into gradient-based optimization workflows, providing enhanced convergence behavior through adaptive learning rates.  

### Example Workflow  

```matlab
% Define the optimization problem
syms x1 x2;
f(x1, x2) = -cos(x1) * cos(x2) * exp(-(x1 - pi)^2 - (x2 - pi)^2);

% Initial point
x = [3.5, 3.5];

% Select a learning rate method
learningRate = BT(x, f); % You can switch to GOLD or SWC

% Perform gradient descent
% ...
```  

## Dependencies  

- MATLAB with Symbolic Math Toolbox.  
