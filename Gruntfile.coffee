module.exports = (grunt) ->
  grunt.initConfig

  # initial setup functions to get latest jquery & bootstrap3

    bower:
      install:
        options:
          targetDir: "build/"
          layout: "byComponent"
          install: true
          verbose: true
          cleanTargetDir: true
          cleanBowerDir: false

    concat:
      options:
        banner: ""
        stripBanners: true

      bootstrap:
        src: ["bower_components/bootstrap/js/transition.js", 
        "bower_components/bootstrap/js/alert.js", 
        "bower_components/bootstrap/js/button.js", 
        "bower_components/bootstrap/js/carousel.js", 
        "bower_components/bootstrap/js/collapse.js", 
        "bower_components/bootstrap/js/dropdown.js", 
        "bower_components/bootstrap/js/modal.js", 
        "bower_components/bootstrap/js/tooltip.js", 
        "bower_components/bootstrap/js/popover.js", 
        "bower_components/bootstrap/js/scrollspy.js", 
        "bower_components/bootstrap/js/tab.js", 
        "bower_components/bootstrap/js/affix.js"]
        dest: "bower_components/bootstrap/js/bootstrap.full.js"


    uglify:
      options:
        banner: ""

      bootstrap:
        src: ["bower_components/bootstrap/js/bootstrap.min.js"]
        dest: "assets/vendor/bs3/bootstrap.min.js"


  # setup my custom directory structure
    shell:
      multiple:
        command:['mkdir assets',
          'cd assets',
          'mkdir css',
          'mkdir fonts',
          'mkdir ico',
          'mkdir img',
          'mkdir js', 
          'mkdir vendor'                  
        ].join('&&')


  #string replace to update the bootstrap.less with my custom overrides & utils

    replace:
      customcssforbootstrap:
        src: ["bower_components/bootstrap/less/bootstrap.less"]
        overwrite: true # overwrite matched source files
        replacements: [
          from: '@import "carousel.less";'
          to: '@import "carousel.less"; \n \n // Custom CSS overrides \n @import "custom/less/custom.less";'
        ]



    copy:
      main:
        expand: true
        flatten: false
        cwd: "bower_components/jquery/"        
        src: "jquery.min.js"
        dest: "assets/js/"

      bscss:
        expand: true
        flatten: false
        cwd: "bower_components/bootstrap/dist/css"        
        src: "bootstrap.min.css"
        dest: "assets/vendor/bs3"

      bsfonts:
        expand: true
        flatten: false
        cwd: "bower_components/bootstrap/dist/fonts"        
        src: "**"
        dest: "assets/vendor/bs3"

      bsjs:
        expand: true
        flatten: false
        cwd: "bower_components/bootstrap/dist/js"        
        src: "bootstrap.min.js"
        dest: "assets/vendor/bs3"




  # setup all the normal tasks to automate stuff.

    less:
      development:
        src: "bower_components/bootstrap/less/bootstrap.less"
        dest: "assets/css/main.css"
        options:
          compress: false
          yuicompress: false
          optimization: 2          


        
    coffee:
      allcoffee:
        src: "custom/coffee/*.coffee"
        dest: "assets/js/app.js"
        options:
          beautify:false
          join: true         


  # lets watch all the stuff going on for live changes.
  # and then update our live reload instance at the server
  # http://localhost:35729

     watch:
      css:
        files: ["custom/less/**/*.less", "custom/**/*.less"] 
        tasks: ["less"]

      customcss:
        files: ["custom/less/**/*.less", "custom/**/*.less"] 
        tasks: ["less"]


      coffee:
        files: ["custom/coffee/**/*.coffee"]
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


  grunt.registerTask "setupbootstrap", "bower"
  grunt.registerTask "copyjquery", "copy"
  grunt.registerTask "copybscss", "copy:bscss"
  grunt.registerTask "copybsfonts", "copy:bsfonts"
  grunt.registerTask "copybsjs", "copy:bsjs"
  grunt.registerTask "setupdirs", "shell"

  grunt.registerTask "replacebs", "replace"


  grunt.registerTask "lesstest", "less:customless"

  grunt.registerTask('lessme', ['less:development']);

  grunt.registerTask('setup-bs', ['setupdirs','setupbootstrap', 'copy:bsfonts', 'copy:bsjs', 'replace:customcssforbootstrap', 'less', 'watch']);
  
  grunt.registerTask('default', ['watch']);
