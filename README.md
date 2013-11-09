
BootApp
version:1.0

I've rewrote all code and essentially this is a framework designed for building bootstrap  3.0+ web apps. It could be modified to build
other apps but the focus is on web apps. This is essentially a blank starter app with a single index file. It uses some of the
best plugins I have found to help when building a web app, or even prototype with bootstrap. This includes:
mediaelement(for creating html 5 video), animo.js+animate.css for doing complex & simple css 3 animations, media-reporter
for helping to test responsive capabilities. Modernizr for doing detection and stuff.

The grunt file has more inline comments about what happens at each point as well as what each step is doing.

The files you can modify are in the "resources" diectory. custom.less has all of the css


Still working on getting the connnect & live reload to work.


PRE-REQUESITES:
1. You need to install node and make sure to set it up for the command line. (http://nodejs.org/)
3. You need to install grunt http://gruntjs.com/getting-started also make sure you use the npm install grunt --save-dev otpion



INSTRUCTIONS:
1. Complete pre-requesites
2. Unzip or git the BootApp Repo to a directory of your choice (ie: test)
3. Open up your favorite command line tool and change to the directory above.
4. Run npm install
4. grunt create-app (you will only need to do this once)

5. If you close out the command window go back to your directory and type grunt 


This will do the following:

1. Get all of the dependencies via bower
2. Setup asset directories (assets)
3. Do some custom variable replacement to setup the bootstrap.less file to inject my custom includes (this allows you to use all the functions of less and custom makes inside of your bootstrap)
4. Will watch your less changes and compile all css to assets/css/main.css
5. Will watch your coffee files and compile all coffee files to assets/js/app.js