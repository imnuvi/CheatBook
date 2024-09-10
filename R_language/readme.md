

# The R 
R is a programming tool most used for data analytics and plotting stuff.
People with little experience in programming like the syntax I think, because it is kinda intuitive if you have never learnt a programming language before.

Personally though, I think it is very unintuitive for me, and I can't really call it a programming language. ( sorry to everyone I pissed off because of this. its just my opinion ) 

Anyways, we'll cover how it's all setup and probably how to set it up to run on jupyter notebooks.





### Setting it up to run on jupyter notebooks.


Install conda, create an environment and install jupyterlab ( if you want more details check out the python cheatbook )
But it should go something like this.

```
mkdir -p ~/miniconda3
curl https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-arm64.sh -o ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm ~/miniconda3/miniconda.sh

~/miniconda3/bin/conda init bash
~/miniconda3/bin/conda init zsh


conda create -n R_playground python=3.10 -y
conda activate R_playground

pip install jupyterlab ipykernel
```


This basically gets our jupyter environment set up. 


Next we will have to install R.
choose a method from here - https://www.r-project.org/
based on your platform


Now we have everything required for installing the R kernel. Essentially what we are doing here is letting jupyterlab know where the R interpretor is located and how to make use of it.
We first start R and run a bunch of commands 

**IMPORTANT:** since we are using conda for the jupyter installation, make sure the proper environment is loadde up before following the below steps


```
/Library/Frameworks/R.framework/Versions/<version>/Resources/bin/R
install.packages("devtools")
devtools::install_github("IRkernel/IRkernel")
IRkernel::installspec()
quit()
```


Now if everything worked, we can start jupyterlab with 

```
jupyter lab
```

and hopefully we will be able to see the R kernel installed and we should by good to go!


*Important:* R on jupyter does not have the functions that R studio has. So you will have to figure out alternatives for them.

For example, you won't find the view() function which is a R studio function. Instead you can use the base head() function or the glimpse() function from tidyverse package.


Happy R'ing!

 

