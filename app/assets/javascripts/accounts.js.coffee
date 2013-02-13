# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  $.fn.exists = ->
    $(@).length() > 0

$(document).ready ->
  $("#github-link").click (event) ->
    event.preventDefault()
    event.stopPropagation()
    if $("#github-profile").exists()
      $("#github-profile").modal()
    else
      $.get "/accounts/github", (data) ->
        $("body").append(data)
        $("#github-profile").modal()

$(document).ready ->
  $("#twitter-link").click (event) ->
    event.preventDefault()
    event.stopPropagation()
    if $("#twitter-profile").exists()
      $("#twitter-profile").modal()
    else
      $.get "/accounts/twitter", (data) ->
        $("body").append(data)
        $("#twitter-profile").modal()
