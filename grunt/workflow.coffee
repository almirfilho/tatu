module.exports = (grunt) ->
  grunt.registerTask 'dev', [
    'test'
    'watch'
  ]

  grunt.registerTask 'test', [
    'coffeelint'
    'mochaTest'
  ]

  grunt.registerTask 'build', [
    'test'
    'coffee'
  ]
