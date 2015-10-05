module.exports = (grunt) ->
  grunt.registerTask 'default', 'help'
  grunt.registerTask 'help', 'availabletasks'

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
