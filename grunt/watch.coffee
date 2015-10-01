module.exports = (grunt) ->
  grunt.config 'watch',
    script:
      files: '{src,test}/**/*.coffee'
      tasks: 'test'
