AutoBootStrap3
version:1.3

This is my blank starter bootstrap 3 dev environment. I rolled this out into a quick pacakge so I can be up and running
with a new site in a matter of moments. It's quick dirty and includes the current version of bootstrap3. 
I only wrote the gruntfile.js and demo.html (based on my own HTML5 boilerplate), custom.less, application.js as well as the structure and architecture of the build ouput. - but the rest comes from a variety of other sources and fantastic projects.
Including animate.css, media reporter, bootstrap3, 


v1.3 

* Added the awesome animate.css - from daneden https://github.com/daneden
* Updated now to use the latest of bootstrap 3 on github - this is a little bit newer than 3.0 final
* the variables file below will need to be updated and replaced
* removed some of my test code.
* added media-reported to the less compile
* re-organized the custom.less file to include 2 pointers to my new media query files.
* temporarily removed responsd.js.min due to cross dom calls on a local -non web server run.
* updated to include glphyicons library


INSTRUCTIONS
* Install the latest version of node. http://nodejs.org
* Create a new empty project directory.
* Install grunt in this directory 
* npm install -g grunt-cli
* Next: npm install grunt --save-dev - to setup grunt in this directory
* Download the repo to a new directory "AutoBootStrap3" site assets will be placed in the assets directory. You shouldn't need to modify the grunt file.
* Install the following libs for grunt via terminal / command line in your new project directory
* npm install grunt-contrib-less,  npm install grunt-contrib-uglify,  npm install grunt-contrib-watch
* If you want to update to the lastest build of bootstrap you can get this from github - https://github.com/twbs/bootstrap
	- Copy the js & less files to the bootstrap3 directory.
	- update the variables.less in the custom directory (newer versions of bootstrap sometimes add new vars)
	- currently using boostrap.min.js - compiled seperately - i also have all the js files just in case i need them.
	- if you change path of assets you will need to update the path in gruntfile.js accordingly
* I have currently one watch command - so from command line enter "grunt watch" from your new project directory.




COMPONENTS
* Boot Strap 3 - as of aug 21 2013
* Glypicons - 
* Custom.less - All my custom css overrides
* Media Queries & Media Reporter - Lets you see a band to view current media query state - Also modifed the queries a bit to work better with my flow.
* Respond.min.js - commented out but allows for IE 7, 8 media query usage
* Jquery
* Shiv
* application.js - holds all custom jquery / js - currently only mins to js/app.js - no merging js i find it's messy when building to merge.


FUTURE:
Some Dev Grunt worker tasks


Thanks to all the amazing authors of all these various components.

Preston McCauley
