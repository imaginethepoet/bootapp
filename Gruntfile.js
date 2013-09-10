module.exports = function(grunt) {


// add a build directory and place bootstrap3 less & js files in directory.
// By default I have some compress settings turned off change compress: true & beautify to true to minimize a file.


  grunt.initConfig({
    uglify: {
      dist1: {
        options: {
          beautify: false
      },
        files: {
          'assets/js/bootstrap.min.js': [  // compile all the latest and greatest boostrap js files.
            'build/bootstrap3/js/transition.js',
            'build/bootstrap3/js/alert.js',
            'build/bootstrap3/js/button.js',
            'build/bootstrap3/js/carousel.js',
            'build/bootstrap3/js/collapse.js',
            'build/bootstrap3/js/dropdown.js',
            'build/bootstrap3/js/modal.js',
            'build/bootstrap3/js/tooltip.js',
            'build/bootstrap3/js/popover.js',
            'build/bootstrap3/js/scrollspy.js',
            'build/bootstrap3/js/tab.js',
            'build/bootstrap3/js/affix.js'
          ]
        }
      }
    },
    uglify: {
      dist2: {
        options: {
          beautify: false
      },
        files: {
          'assets/js/app.js': [  // compile all the latest and greatest boostrap js files.
            'build/custom/application.js',
          ]
        }
      }
    },
    coffee: {
      allcoffee: {
        options: {
          beautify: false
      },
        files: {
          'assets/js/demo.js': [  // compile all the latest and greatest coffee files
            'build/custom/js/**/*.coffee',
          ]
        }
      }
    },         
    less: {
      development: {
        options: {
          compress: false,
          yuicompress: false,
          optimization: 2
        },
        files: {
          // target.css file: source.less file
          "assets/css/main.css": "build/bootstrap3/less/bootstrap.less"
        }
      }
    },
    watch:{
      less: {
        files: ['build/bootstrap3/less/**/*.less'], // watch for less file changes
        tasks: ['less']
      },
      customless: {
        files: ['build/custom/**/*.less'], // watch for less file changes
        tasks: ['less']
      },
      javascript: {
        files: ['build/custom/application.js'],
        tasks: ['uglify:dist2' ]
      },
      allcoffee: {
        files: ['build/custom/js/**/*.coffee'],
        tasks: ['coffee' ]
      }      
    }
  });
 
  grunt.loadNpmTasks('grunt-contrib-jshint');
  grunt.loadNpmTasks('grunt-contrib-less');
  grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-contrib-coffee');

};