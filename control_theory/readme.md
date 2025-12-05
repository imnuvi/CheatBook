

## Control Theory:

Control theory is a field of math and engineering that deals with dynamical systems. The goal is to apply inputs onto a system and drive it towards a specific state. This is applied in a lot of fields such as Electronics, mechanical engineering and robotics.


### Application:
Usually, the theory is that we don't directly set the state to a new set. Instead, we apply velocity on the system to push it into a system. This comes from the basic principles of derivative. 
- an observation x(t) is the point/position
- the first derivative dx/dt is the velocity of the point. also represented as x'.
- The second derivative d^2x/dt^2 is the acceleration. also repsented as x'' or x double dot.  
    - similarly force = mass x acceleration. So force also depends on the second derivative

newton's law F = ma

a = x''

F = m x''


which means, if we exert control on the acceleration, then the new position needs to be double integrated.