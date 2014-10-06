linterPath = atom.packages.getLoadedPackage("linter").path
Linter = require "#{linterPath}/lib/linter"
{findFile, warn} = require "#{linterPath}/lib/utils"

class LinterDekiScript extends Linter

  # The syntax that the linter handles. May be a string or
  # list/tuple of strings. Names should be all lowercase.
  @syntax: ['source.dc']

  # A string, list, tuple or callable that returns a string, list or tuple,
  # containing the command line (with arguments) used to lint.
  cmd: 'dekilint'

  linterName: 'dekiscript'

  regex:
    'line: (?<line>[0-9]+) column: (?<col>[0-9]+) message: (?<message>.+)\n'

  isNodeExecutable: yes

  constructor: (editor) ->
    super(editor)
    atom.config.observe 'linter-dekiscript.dekiLintExecutablePath',
      @formatShellCmd

  formatShellCmd: =>
    dekiLintExecutablePath =
      atom.config.get 'linter-dekiscript.dekiLintExecutablePath'
    @executablePath = "#{dekiLintExecutablePath}"

  destroy: ->
    atom.config.unobserve 'linter-dekiscript.dekiLintExecutablePath'

module.exports = LinterDekiScript
