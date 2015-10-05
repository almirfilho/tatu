path = require 'path'
coffeeCoverage = require 'coffee-coverage'
projectRoot = path.resolve __dirname, '../'
coverageVar = coffeeCoverage.findIstanbulVariable()
writeOnExit = if not coverageVar then "#{projectRoot}/test/coverage-coffee.json" else null

coffeeCoverage.register
    instrumentor: 'istanbul'
    basePath: projectRoot
    exclude: ['test', 'node_modules', '.git', 'Gruntfile.coffee', 'grunt']
    coverageVar: coverageVar
    writeOnExit: writeOnExit
    initAll: true
