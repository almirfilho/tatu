module.exports = (grunt) ->
  # grunt-istanbul task
  grunt.config 'makeReport',
    src: '<%= pkg.config.coverage.dataFile %>'
    options:
      type: false
      dir: false
      print: 'detail'

  # grunt-istanbul-coverage task
  grunt.config 'coverage',
    default:
      options:
        root: '.'
        dir: 'test'
        thresholds:
          statements: 90
          branches: 90
          lines: 90
          functions: 90
