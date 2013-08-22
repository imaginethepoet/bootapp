module.exports = function(grunt) {


// add a build directory and place bootstrap3 less & js files in directory.


  grunt.initConfig({
    uglify: {
        options: {
          mangle: false
        },
        my_target: {
          files: {
            'assets/js/app.js': ['build/custom/application.js']  // dest - src - I only care to minify my own JS file
          }
        }
      },
    less: {
      development: {
        options: {
          compress: true,
          yuicompress: true,
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
        tasks: ['uglify']
      }
    }
  });
 
  grunt.loadNpmTasks('grunt-contrib-less');
  grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-contrib-watch');
 

};