 

 # here is a list of good habits to follow during dev


 1. always use env variables for any project you create:
    for node apps use the dotenv package. 
      ```npm install dotenv``` and use it like so
      const dotenv = require('dotenv')
      dotenv.config()
      console.log(`Your VALUE is ${process.env.KEY}`)

      here the environment is a .env file with all the required key value pairs separated by equals symbol. by default dotenv will look at the home directory of the package for the env file. add the .env file to gitignore
