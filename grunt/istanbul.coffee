module.exports = (grunt) ->
  grunt.config 'makeReport',
    src: 'test/coverage-coffee.json'
    options:
      type: false
      dir: false
      print: 'detail'
