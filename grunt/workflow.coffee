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
    'cover'
    'coffee'
  ]

  grunt.registerTask 'cover', ->
    require('child_process').spawnSync 'grunt', ['test'], stdio: 'inherit'
    grunt.task.run [
      'makeReport'
      'coverage'
    ]
