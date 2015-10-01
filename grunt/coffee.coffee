module.exports = (grunt) ->
  grunt.config 'coffee',
    dist:
      options:
        bare: true
      files: [
        expand: true
        cwd: 'src'
        dest: 'dist/lib'
        src: '**/*.coffee'
        ext: '.js'
      ]
