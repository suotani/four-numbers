App.white_board = App.cable.subscriptions.create "WhiteBoardChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    console.log(data)
    $("#read_board").html(data["message"])
    $("#write_board").html(data["data"])
    # Called when there's incoming data on the websocket for this channel

  write: (data) ->
    @perform 'write', data: data

$(document).on 'click', '#submit', (e) ->
  App.white_board.write $("#write_board").val()