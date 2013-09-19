
AutoBootStrap3
version:2.0

This is my blank starter bootstrap 3 dev environment. I rolled this out into a quick pacakge so I can be up and running
with a new site or application prototype in a matter of moments. With the user of node  express you get an instance web server.
This is tuned to my own development and the way I like to build quick prototypes, or entire web sites. It's comprised of gruntfile.coffee, 
and several components to help test responsive design.

In every way possible I have decoupled bootstrap3 so it's easier to update when changes come along. This includes if you needt to make
one off fixes. I've included the fantastic animo.js & animate.css library for css 3 transitions management. My own version of HTML5 Boilerplate.

You can write your application functions in js, but I currently only support coffeescript. 


PRE-REQUESITES:
1. You need to install node and make sure to set it up for the command line. (http://nodejs.org/)
2. Make sure you install "git" grunt bower will need this to git packages and make sure its command line accessible.
3. You need to install grunt http://gruntjs.com/getting-started also make sure you use the npm install grunt --save-dev otpion



DIRECTORY EXPLANATIONS:
* All production assets are in the assets directory
*  js/vendor - contains third party scripts by components

* build - contains all the necessary pre production assets including a few custom ones
  - /build/custom - These are a lot of my custom implementations.
  		-/custom/coffee - custom coffee scripts go in here all gets compiled to /assets/js/app.js
		-/custom/fonts - custom fonts
		-/custom/less/ - all less files in here get compiled to assets/css/main.css 
		I do a custom injection of a "custom.less" into bootstrap.less to allow for using mixins etc..
		-/custom/variables/ - 


INSTRUCTIONS:
1. Complete pre-requesites
2. Unzip "AutoBootStrap3" or git it to an empty directory ie "test" 
3. Open up your favorite command line tool and cd to the directory you created
4. Enter npm install - this should setup all the pre-requesite node modules
5. For a first time setup of bootstrap, and to create the assets directory run "grunt setup-bs"
6. You should now have the assets directory, and everything you need!
7. Type "grunt watch" - this will setup an instance of watch that will check for changes in your less, coffeescript, compile
and update your assets folder. 


TROUBLESHOOT:
You may need to use SUDO on mac if any of the pre-reqs fail.



v2.0
* What happened to 1.5 & 1.6. Well I sort of leap frog them. It seemed fitting to just roll up to 2.0
with all the changes I have made.

* Tied in bower and an initial "grunt setup" command (meant to be ran once). This will essentially
go out pull the latest bootstrap. Install it and copy out the appropriate files to the js directory.



v1.5
* Added initial support for coffeescript. 


v1.4 

* rewrote a lot of the grunt script to allow for minify of appjs & pre-compile of bootstrap.min.js



v1.3 

* Added the awesome animate.css - from daneden https://github.com/daneden
* Updated now to use the latest of bootstrap 3 on github - this is a little bit newer than 3.0 final
* the variables file below will need to be updated and replaced
* removed some of my test code.
* added media-reported to the less compile
* re-organized the custom.less file to include 2 pointers to my new media query files.
* temporarily removed responsd.js.min due to cross dom calls on a local -non web server run.
* updated to include glphyicons library





COMPONENTS
1. Boot Strap 3 - as of aug 21
2. Glypicons - 
3. Custom.less - All my custom css overrides
4. Media Queries & Media Reporter - Lets you see a band to view current media query state - Also modifed the queries a bit to work better with my flow.
5. Respond.min.js - commented out but allows for IE 7, 8 media query usage
6. Jquery
7. Shiv
8. application.js - holds all custom jquery / js - currently only mins to js/app.js - no merging js i find it's messy when building to merge.


FUTURE:
Some Dev Grunt worker tasks


Preston McCauley