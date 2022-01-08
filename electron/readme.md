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

- always use the path module and the __dirname variable so that you can always reference the files you are looking for

