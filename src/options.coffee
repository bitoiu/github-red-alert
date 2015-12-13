saveOptions = ->
  chrome.storage.sync.set
    token: document.getElementById('token').value,
    interval: document.getElementById('interval').value,
  , ->
    status = document.getElementById('status')
    status.textContent = 'Options saved.'
    setTimeout ->
      status.textContent = ''
    , 750

restoreOptions = ->
  chrome.storage.sync.get
    token: "",
    interval: 30
  , (items) ->
    document.getElementById('token').value = items.token
    document.getElementById('interval').value = items.interval

document.addEventListener 'DOMContentLoaded', restoreOptions
document.getElementById('save').addEventListener 'click', saveOptions