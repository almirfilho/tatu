module.exports = (grunt) ->
  grunt.registerTask 'dev', 'watch'
  grunt.registerTask 'test', 'mochaTest'
  grunt.registerTask 'script', 'test'