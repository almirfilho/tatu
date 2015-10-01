module.exports = (grunt) ->
  grunt.registerTask 'dev', 'watch'

  grunt.registerTask 'test', [
    'coffeelint'
    'mochaTest'
  ]

  grunt.registerTask 'build', [
    'test'
    'coffee'
  ]
