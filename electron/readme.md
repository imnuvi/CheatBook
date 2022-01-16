To run electron you will need node js . Electron basically uses node with the chrome v8 engine and provides a way to basically run any webpage you want as an application

steps to start a basic electon app:

- create a project folder
- create npm package with `npm init`
- next install electron package  `npm install --save-dev electron`
    -- ( by the way --save-dev saves the package such that it is not pushed when building. Electron is just for building. After packaging its not necessary Ig )

- next add a start script in package.json file that was created during npm
  `{
    "scripts": {
      "start": "electron ."
    }
  }`
 
- now we need to create two important files. main.js and index.html
  - the main.js is the entrypoint file for our app. index.html file tells the runner which page to render. ( there is another way where we can specify the website to render on our app )

- we will need two modules in our main.js file for running our app
  - App module , which controls the app's lifecycle'
  - BrowserWindow module, which creates and manages the application windows
  `const { App, BrowserWindow ]} = require('electron')`


- we need to initialize the BrowserWindow and use its loadfile method to load the html file
  `
  function createwindow(){
  const win = new BrowserWindow({
    width: 800,
    height: 600
  })

  win.loadFile('index.html')
}`

- now this crate window function can be called only after the app is ready and fires the ready event


`const win = new BrowserWindow({
    width: 800,
    height: 600
  })

  win.loadFile('index.html')`


- in order to handle window conditions for different platforms we have to write our own conditions and logic and their appropriate lifecycle methods
- Now to access content from the global content in our index.html we need to preload some contnet before the rendering happens ( this is because the window and the render process are in different threadshttps://www.youtube.com/watch?v=cvTipU9gN5g)

- always use the path module and the `__dirname` variable so that you can always reference the files you are looking for

__
excerpt from this talk
https://www.infoq.com/presentations/electron-pitfalls/

Things to keep in mind:
Generally how the electron app runs is with the main process and the render process

Main process  - tells all the other processes what to do. 
render process - actually renders the dom elements and displays the Gui

so usually its a really bad idea to do hard computing on either of these two processes. Lets say we want to calculate pi or count to infinitiy. this is really computing intensive. Now if we run this on the main process, we are essentially taking up athe main thread and doing computation on this. Now if we look back the main process actually does a lot of stuff. not just the calculation that we sent it but it also routes the apis to the chrome engine, tells the render process what to render, and a whole bunch of other stuff. now if we put this process under load then our render calls would become slow and janky. 

now if we put the calculation on the render process itself, then the dom loading and event listeners that are running would stop and slow down the rendering of our frontend render and make our app really janky. 


Now here is where we need to know about the remote module. Basically the remote module allows us to create a messaging platform between the main process and other windows that are open from the render process. But this `remote` module is synchronous. which means it sends out blocking calls to the main process. which means if there a lot of remote calls it will also block the performance


Here we can use the Electron-Remote package. What it essentially does is, it spawns some new windows that will perform the background processes. so essentially webpages/windows that dont show a gui and are hidden, but will be running the computation stuff that we provided it in the background. We can consider them as separate threads and can use our Processing power to calculate the hard stuff without making our app experience janky.


The
RequestIdleCallback api:

this api is in the chrome engine and since we are in electron we can use any chrome api without worrying about other engines implementing it( like IE )
so requestIdleCallback api basically gives us a way to check if the app isnt in use for a while by the user. lets say we are doing lots of db operations like 100 put operations. Now we split it into chunks of 10. when we do the requestIdleCallback function, it tells us if there is like 300 ms to perform an action. once ten put operations are done, the api is called again, the next 10 start and if any are stuck in the middle, then we wait till we get the next opportunity to perform and complete it



Local code only:

now what this means is dont load code from other places. so no Babel, No SaaS stuff. If all your code is local and packaged with the app you send. 
