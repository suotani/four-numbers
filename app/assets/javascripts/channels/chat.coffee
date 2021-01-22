$(document).ready ->
  App.chat = App.cable.subscriptions.create {channel: "ChatChannel",room_id:  $("#id").val()} ,
    connected: ->
      # Called when the subscription is ready for use on the server

    disconnected: ->
      # Called when the subscription has been terminated by the server

    received: (data) ->
      console.log(data)
      $("#messages").append data["chat"]

    speak: (message)->
      # channelのspeakを起動
      @perform 'speak', message: message, room_id: $("#id").val()
      #@perform 'check' のように書くと、ChatChannelのcheckメソッドが起動

$(document).on 'keypress', '[data-behavior~=chat_speaker]', (e) ->
  if e.keyCode is 13
    App.chat.speak e.target.value, $("#id").val()
    e.target.value = ""
    e.preventDefault