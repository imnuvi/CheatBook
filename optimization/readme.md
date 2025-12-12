


### Optimization:

In calculus, Opitimization is looking at the greatest or the lowest value that a function can take.

*Finding critical points:*
In order to find the critical points of a function, we set the function to 0. ( Critical points also exists where the function does not exist )

*In the general sense*
*Finding general extrema:*

A function needs to be continuous with the interval inclusive for us to be able to calculate the extrema ( maxima or minima )

This can be proved by the extreme value theorem - This tells us that, as long as a function is continuous in the inclusive interval, we can find out the minimum and the maximum of that function within the interval.

Here we can say that the absolute extrema can occur at endpoints ( the intervals ) or at relative extrema. The list of critical points along with the end points is a list of all possible relative extrema.


This is identified by three steps:

- Verify function is continuous in the interval
- Find all critical points of f in the interval
- evaluate the function at critical points
- identify absolute extrema


Now this procedure is just to find the maximum extrema. This is one way of finding the extrema. But this might not always be feasible as the function should be continuous in the interval and in the inclusive end points of the interval.


## Actually optimizing:

Now the general extrema is one way to figure out the max or min of the function. The other way is the First Derivative Test.
Here, we need an interval of possible values of the independent variable in the function. This method needs to be continous at the end points and continuous on the interior of the interval.


*The First Derivateive Test:*
x=9 is a critical point of f(x)

- if f'(x) > 0 to the left of x = c and f'(x) < 0 to the right of x = c, then x = c is a relative maximum
- if f'(x) < 0 to the left of x = c and f'(x) > 0 to the right of x = c then x = c is a relative minimum
- if f'(x) is the same sign on both sides of x = c, then x = c is neither a relative maximum nor a relative minimum

Let's say for our hypothetical function, the second condition is true. Thsi does not mean x = c is the absolute maximum. But, if we know that f'(x) > 0 for all x < c, and the other way f'(x) < 0 for all x > c, then we will know for sure that the absolute maximum of f(x) will occur at x = c.  ( One thing to note is that the function needs to be continuous within the interval )



*The Second Derivative Test:*
if x = c is a critical point of f(x) such that f'(c) = 0 and f''(x) is continuous in a region around x = c, then 

- if f''(c) < 0then x = c is the relative maximum
- if f ''(c) > 0 then x = c is the relative minimum
- if f''(c) = 0, then x = c can be a relative maximum, relative minimum or neither.


Similar to the first derivative test, if the f''(x) is > 0 for all x, then f(c) will be the absolute minimum.


NOTE!: Both these first order and second order derivative tests need the function to have only one critical point within the interval. 

Now, this might all seem very very confusing. The way to think about this is in terms of general derivatives and differential equations. First derivative is the velocity and second is the acceleration. This means that we are looking at if the acceleration is strictly increasing of decreasing on both sides and if the acceleration is increasing or decreasing to figure out where the maximum and minimum points are. This is a good tool to think about mathematical functions imo.


These ideas can be used in any sort of optimization problems. for example the largest area of a print surface based on the length and width etc etc.


Now, how does this all tie back to gradient descent? We know that the first derivative - gives us the gradient of a variable. If we have two dimensions, this will give us the first derivative of x and the first derivative of y, essentially telling us how the gradient of the plane looks.


$$
f(x, y) = x^2 + y^2
$$

Now for this function, we need to find the gradient

$$
\nabla f(x, y) = 
\begin{bmatrix}
    \partial{f}/\partial(x)\\
    \partial{f}/partial{y}
\end{bmatrix} = \begin{bmatrix} 2x \\ 2y \end{bmatrix}
$$

Here, this is the gradient term which basically tells us how each of these dimensions change. Gradient descent just tells us which direction to take and the learning rate tells us how long of a step to take. Eventually, we will end up at the bottom of the function at the minimum for gradient descent, or at the maximum for gradient ascent. But if we don't exactly know what the function is, then we will need to explore the entire function for the min or max and then that's how we reach the optimum point.

All the simple examples we saw have one or two variables. But in a machine learning setting, we have millions of parameters that need to be solved, which basically there is no way to solve it. But the best we can do is to approximate the value with a numerical method and hope that we will land at the optimum without having to solve the entire math algebraically. 



Nice!


### Gradient free optimizations:
These are algorithms that do not require the gradient - simple as that. Instead of calculating the gradient, search happens directly on the function f(x).

These are used in places where gradients don't exist and are too expensive, the function is noisy or unknown, or evaluation is done via simulation.

Examples:
Here are a few good examples:

- Grid search
- Genetic algorithms
- Bayesian optimization.
- Particle Swarm optimization