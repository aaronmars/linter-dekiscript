path = require 'path'

module.exports =
  configDefaults:
    dekiLintExecutablePath:
      path.join __dirname, '..', 'node_modules', 'dekilint', 'bin'

  activate: ->
    console.log 'activate linter-dekiscript'
