module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json'),

  # initial setup functions to get lates bootstrap, jquery, and component resources, media element, modernizr,animo.js

    bower:
      install:
        options:
         targetDir: "pre-build/"
         layout: "byComponent"
         install: true
         verbose: true
         cleanTargetDir: true
         cleanBowerDir: false


  # setup my resources directory structure
    shell:
      setupdirs:
        command:['mkdir assets',
          'cd assets',
          'mkdir css',
          'mkdir fonts',
          'mkdir ico',
          'mkdir img',
          'mkdir js', 
          'mkdir vendor'                  
        ].join('&&')






  #string replace to update the bootstrap.less with my resources overrides & utils
  # this allows you to use the core bootstrap less files and all the make commands inside
  # also allow syou to update your app with bootstrap css file & include your own custom overrides at the end
  # this does a search in the distribution of bootstrap and overwrites the file but first inserts a link to the resources folder
  # Once this link is in place watching less will compile and run all your resources in to one nice main.css file

    replace:
      resourcescssforbootstrap:
        src: ["bower_components/bootstrap/less/bootstrap.less"]
        overwrite: true # overwrite matched source files
        replacements: [
          from: '@import "carousel.less";'
          to: '@import "carousel.less"; \n \n // custom CSS overrides and resources \n@import "resources/less/custom.less";'
        ]



    copy:
      bsjs:
        expand: true
        flatten: false
        cwd: "bower_components/bootstrap/dist/js/"        
        src: "bootstrap.min.js"
        dest: "assets/js/"

      jqueryjs:
        expand: true
        flatten: false
        cwd: "bower_components/jquery/"        
        src: "jquery.min.js"
        dest: "assets/js/"

      animojs:
        expand: true
        flatten: false
        cwd: "bower_components/animo.js/"        
        src: "animo.js"
        dest: "assets/js/"

      animocss:
        expand: true
        flatten: false
        cwd: "bower_components/animo.js/"        
        src: "animate+animo.css"
        dest: "assets/css/"

      modernizrjs:
        expand: true
        flatten: false
        cwd: "bower_components/modernizr/"        
        src: "modernizr.js"
        dest: "assets/js/"

      mediaelementpackage:
        expand: true
        flatten: false
        cwd: "bower_components/mediaelement/build"        
        src: "**"
        dest: "assets/vendor/mediaelement"



  # setup a webserver instance.
    connect: 
      all: 
        options: 
          port: 9000
          base: ['.']
          livereload: true
 


  # setup all the normal tasks to automate stuff.

    less:
      development:
        src: "bower_components/bootstrap/less/bootstrap.less"
        dest: "assets/css/main.css"
        options:
          compress: true
          yuicompress: true
          optimization: 2          


        
    coffee:
      allcoffee:
        src: "resources/coffee/*.coffee"
        dest: "assets/js/app.js"
        options:
          beautify:false
          join: true         


  # lets watch all the stuff going on for live changes.
  # and then update our live reload instance at the server
  # http://localhost:9001

     watch:
      options:
        atBegin:true
        livereload: true
      css:
        files: ["resources/less/**/*.less", "resources/**/*.less"] 
        tasks: ["less"]

      coffee:
        files: ["resources/coffee/**/*.coffee"]
        tasks: ["coffee"]




  grunt.loadNpmTasks "grunt-shell"
  grunt.loadNpmTasks "grunt-contrib-jshint"
  grunt.loadNpmTasks "grunt-contrib-less"
  grunt.loadNpmTasks "grunt-contrib-uglify"
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-contrib-coffee"
  grunt.loadNpmTasks "grunt-bower-task"
  grunt.loadNpmTasks "grunt-contrib-copy"
  grunt.loadNpmTasks "grunt-contrib-uglify"
  grunt.loadNpmTasks "grunt-contrib-concat"
  grunt.loadNpmTasks "grunt-text-replace"


  #create app dir structure to be served up via connect
  grunt.registerTask "setup-app-dirs", "shell:setupdirs"


  #register taks to load bootstrap via bower and begin processing
  grunt.registerTask "setup-bs-app-files", "bower"


  #copy tasks
  grunt.registerTask "copy-bs-js", "copy:bsjs"
  grunt.registerTask "copy-jquery-js", "copy:jqueryjs"
  grunt.registerTask "copy-animo-js", "copy:animojs"
  grunt.registerTask "copy-animo-css", "copy:animocss"
  grunt.registerTask "copy-modernizr-js", "copy:modernizrjs"
  grunt.registerTask "copy-mediaelement-package", "copy:mediaelementpackage"


  #copy all
  grunt.registerTask('copy-all', ['copy-bs-js', 'copy-jquery-js', 'copy-animo-js', 'copy-modernizr-js','copy-mediaelement-package']);



  # task to update the variables with a custom variable replacement for custom css injection from less
  grunt.registerTask "allow-custom-css", "replace:resourcescssforbootstrap"


  # run all the steps to build a custom bootapp
  grunt.registerTask('create-app', ['setup-app-dirs', 'setup-bs-app-files', 'copy-all', 'allow-custom-css', 'watch']);

  #create create connect server
  grunt.registerTask "connect-server", "connect:server"

  
  grunt.registerTask('default', ['watch', 'connect-server']);
