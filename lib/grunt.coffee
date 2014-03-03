GruntView = require './grunt-view'

module.exports =
  gruntView: null

  activate: (state) ->
    @gruntView = new GruntView(state.gruntViewState)

  deactivate: ->
    @gruntView.destroy()

  serialize: ->
    gruntViewState: @gruntView.serialize()
