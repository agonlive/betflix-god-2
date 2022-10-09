BetflixGod2View = require './betflix-god-2-view'
{CompositeDisposable} = require 'atom'

module.exports = BetflixGod2 =
  betflixGod2View: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @betflixGod2View = new BetflixGod2View(state.betflixGod2ViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @betflixGod2View.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'betflix-god-2:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @betflixGod2View.destroy()

  serialize: ->
    betflixGod2ViewState: @betflixGod2View.serialize()

  toggle: ->
    console.log 'BetflixGod2 was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
