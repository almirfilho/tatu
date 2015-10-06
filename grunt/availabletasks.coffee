tasks =
  help:   'Prints this list of available tasks.'
  test:   'Runs all tests.'
  cover:  'Runs all tests with coverage.'
  dev:    'Regenerates scripts while keeps watching files for modifications.'
  build:  'Regenerates scripts and compressed files for production (dist).'

module.exports = (grunt) ->
  grunt.config 'availabletasks',
    tasks:
      options:
        hideUngrouped: true
        descriptions: tasks
        sort: Object.keys tasks
        groups: 'tatu tasks': Object.keys tasks
