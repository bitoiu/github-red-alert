class GitHubRedAlert

  token=""

  update: -> $.ajax
    url: 'https://api.github.com/notifications?participating=true&access_token=' + token
    cache: false
    success: ((_this) ->
      (data) ->
        participating_count = data.length
        console.debug 'GitHub Red Alert: You have ' + participating_count + ' participating notifications'
        $('.notification-indicator .mail-status').toggleClass('red-alert', participating_count > 0)
        $('a.notification-indicator').attr('href', if participating_count > 0 then '/notifications/participating' else '/notifications')
    )(this)

  constructor: ->

    chrome.storage.sync.get
      token: "",
      interval: 5
    , (items) =>
      token = items["token"]
      interval = items["interval"]
      if @token == ""
        console.warn "GitHub Red Alert: Please specify a personal access token via the options page."
      else
        @update()
        console.debug "GitHub Red Alert: Using a #{interval} second refresh interval"
        setInterval @update, interval * 1000

$ ->
  new GitHubRedAlert()