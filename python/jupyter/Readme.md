


Jupyter is a really good tool for Running python, R and julia code. It is basically just an interface that connects with the interpreter kernels and runs code within them. 


The best environment manager is conda in my opinion and you can just use it from the command line.

check out miniconda sh installer for more steps



To install a conda env to a particular ipykernel for use in jupyter notebook


ipython kernel install --user --name=<any_name_for_kernel>


To check all the available kernels in the machine

jupyter kernelspec list






To customize jupyterlab, we can use the jupyterthemes package


```
pip install jupyterthemes
jt -t solarizedd

```

jt will set the jupyter theme to whichever you specify.


You will have to set the plotting color because looks may change because of the theme

```
import plotly.io as pio
pio.templates.default = "plotly_dark"

import matplotlib.pyplot as plt  
plt.style.use('dark_background')
```
