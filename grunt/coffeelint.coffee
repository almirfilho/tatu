module.exports = (grunt) ->
  grunt.config 'coffeelint',
    script:
      files:
        src: '{src,test}/**/*.coffee'
      options:
        arrow_spacing: level: 'error'
        braces_spacing: level: 'error', spaces: 1, empty_object_spaces: 0
        colon_assignment_spacing: level: 'error', spacing: left: 0, right: 1
        ensure_comprehensions: 'error'
        eol_last: 'error'
        line_endings: 'error'
        no_empty_functions: 'error'
        no_empty_param_list: 'error'
        no_nested_string_interpolation: 'error'
        no_this: 'error'
        missing_fat_arrows: 'error'
        no_private_function_fat_arrows: 'error'
        no_unnecessary_fat_arrows: 'error'
        prefer_english_operator: 'error'
        space_operators: 'error'
        spacing_after_comma: 'error'
