coffeeCoverage = require 'coffee-coverage'
rootdir = require('path').resolve __dirname, '../'
pkg = JSON.parse require('fs').readFileSync "#{rootdir}/package.json", 'utf8'

coverageVar = coffeeCoverage.findIstanbulVariable()
writeOnExit =
  if coverageVar then null
  else "#{rootdir}/#{pkg.config.coverage.dataFile}"

coffeeCoverage.register
  instrumentor: 'istanbul'
  basePath: rootdir
  exclude: pkg.config.coverage.excludeFiles
  coverageVar: coverageVar
  writeOnExit: writeOnExit
  initAll: true
