# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

ready = ->
  # jQuery.fn.exists -- Check if a DOM element exists.
  $.fn.exists = ->
    @length > 0

  # #github-link events
  $("#github-link").click (event) ->
    event.preventDefault()
    event.stopPropagation()
    if $("#github-profile").exists()
      $("#github-profile").modal()
    else
      $.get "/accounts/github", (data) ->
        $("body").append(data)
        $("#github-profile").modal()

  # #twitter-link events
  $("#twitter-link").click (event) ->
    event.preventDefault()
    event.stopPropagation()
    if $("#twitter-profile").exists()
      $("#twitter-profile").modal()
    else
      $.get "/accounts/twitter", (data) ->
        $("body").append(data)
        $("#twitter-profile").modal()

$(document).ready(ready)
$(document).on('page:load', ready)
