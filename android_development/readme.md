
we will be using android studio to create an android app

- install all the required stuff with android studio and set it up ( fairly straight forward. If not check the docs bro )
- enable developer options on your mobile and connect it to your laptop via usb cable. and enable usb debugging in the developer options
- create a new project with whichever template you want.
  - one additional thing you will have to do is setup the build tools version and the android sdk version. This is setup by going to the file option and project structure. go to modules panel and in the properties tab select the version whichever you have installed and is the latest one
- now build the code and the device should show up in the run options. Click on run and the app will run on the android device.

the folder structure of a project is as follows

project
  app
    - Manifest
      the manifest file that enables how the app is structured and which classes are loaded. the app permissions and stuff is also declared here
    - java
      this folder consists of the kotlin backend code and the test files that will be used to enable the logic for the app
    - java ( generated )
      this is the build java files that will actually be run on the app
    - res
      this folder consists of the static files and layout of our app
  Gradle Scripts
    These scripts are used for building the app and providing the apk file that will run on the device


two of the main files that are essential are the MainActivity.kt kotlin file and the activity_main.xml file which is present in the res folder.

the mainActivity kotlin file is called the activity that will be started when the app starts and what it does

The activity_main.xml file actually defines the layout of how our app will look like. the components of this file are called views and these views are 
These views are converted into Kotlin view objects during runtime by a process called layout inflation, which can then be rendered and dynamically changed as the application runs.
you have to provide a namespace in which the view is rendered in. So basically lets say you want to run some code in testing environment that doesnt have the actual runtime files, you can provide a default file with the tools namespace

for eg:
  we have an <ImageView android:src='actual_image'
                        tools:src='demo_image'/>

  here during testing you will get the demo image and when you actually build the app you will see the actual_image file.

each of these activity is defined in the manifest on where they run. so the starting point of the application is the manifest file.
the main activity class runs a set of functions as a setup. one of these functions is the oncreate function which we will override with our own stuff. here we will call the setContentView method which will specify the layout that will be used and will also inflate the view.

usually it is a better practice to put your strings in the res folder . there is a folder called vars within this and in that create a file called strings.xml , follow the syntax <string name=mystr>myvalue</string>  and then access them with the @string/string_name


now the kotlin code actually runs the logic that happens when the user interacts. To do this we need to reference the elemenets on the view from the kotlin code.
the layout is actually connected with the kotlin objects in a view hierarchy tree. This is basically how you access the children from the parent. This can be done with a unique id ( just like react ids bro ). you can then use the method findViewByID to get the element which you had named in the layout file.


note: also you will see a lot of R everywhere in the If you meant "java" specifically:
It was migrated from homebrew/cask to homebrew/core.If you meant "java" specifically:
It was migrated from homebrew/cask to homebrew/core.kotlin code. This R stands for resource. Essentially whenever you create an id and stuff the object gets added to the resource and can be accessed within the codebase.
