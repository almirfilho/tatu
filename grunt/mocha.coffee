module.exports = (grunt) ->
  grunt.config 'mochaTest',
    test:
      src: 'test/**/*-test.coffee'
      options:
        reporter: 'nyan'
        require: 'coffee-script/register'
