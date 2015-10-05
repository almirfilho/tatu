module.exports = (grunt) ->
  grunt.config 'mochaTest',
    test:
      src: 'test/**/*-test.coffee'
      options:
        reporter: if grunt.option 'travis' then 'spec' else 'nyan'
        require: [
          'coffee-script/register'
          'test/coverage-register.coffee'
        ]
