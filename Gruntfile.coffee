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
        dest: "assets/js/bootstrap.min.js"


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

    connect: 
      site1: 
        options: 
          port: 7000,
          base: ''
        
    coffee:
      allcoffee:
        src: "build/custom/coffee/*.coffee"
        dest: "assets/js/app.js"
        options:
          beautify:false
          join: true         


  # lets watch all the stuff going on for live changes.
     watch:
        less:
          files: ["build/bootstrap3/less/**/*.less", "build/custom/**/*.less"] 
          tasks: ["less"]

        coffee:
          files: ["build/custom/coffee/**/*.coffee"]
          tasks: ["coffee"]



  grunt.loadNpmTasks "grunt-contrib-connect"
  grunt.loadNpmTasks "grunt-contrib-jshint"
  grunt.loadNpmTasks "grunt-contrib-less"
  grunt.loadNpmTasks "grunt-contrib-uglify"
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-contrib-coffee"
  grunt.loadNpmTasks "grunt-bower-task"
  grunt.loadNpmTasks "grunt-contrib-copy"
  grunt.loadNpmTasks "grunt-contrib-uglify"
  grunt.loadNpmTasks "grunt-contrib-concat"

  grunt.registerTask "setup", "bower"
  grunt.registerTask "copyjquery", "copy"
  grunt.registerTask "copybscss", "copy:bscss"
  grunt.registerTask "copybsfonts", "copy:bsfonts"
  grunt.registerTask "copybsjs", "copy:bsjs"

  grunt.registerTask('lessme', ['less:development']);

  grunt.registerTask('dist-js', ['concat', 'uglify']);

  grunt.registerTask('setupbs', ['copy:bscss', 'copy:bsfonts', 'copy:bsjs']);
  grunt.registerTask('default', ['connect', 'watch']);
