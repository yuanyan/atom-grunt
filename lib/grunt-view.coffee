{View} = require 'atom'

module.exports =
class GruntView extends View
  @content: ->
    @div class: 'grunt tool-panel panel-bottom padded', =>
      @div class: 'close-icon'
      @div 'The Grunt package is Alive!'

  initialize: (serializeState) ->
    atom.workspaceView.command 'grunt:run', => @toggle()
    atom.workspaceView.find('.grunt > .close-icon').click => @toggle()

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @detach()

  toggle: ->
    console.log "GruntView was toggled!"
    if @hasParent()
      @detach()
    else
      atom.workspaceView.appendToBottom(this)
  # Public:
  appendLeft: (item) ->
    @leftPanel.append(item)

  # Public:
  appendRight: (item) ->
    @rightPanel.append(item)

  # Public:
  getActiveItem: ->
    atom.workspaceView.getActivePaneItem()
