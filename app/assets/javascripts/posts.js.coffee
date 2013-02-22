# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

ready = ->
  # @todo (farleyknight@gmail.com): Load up the javascript files that are provided via Wordpress for gist code examples

  $(".spin").spin
    lines: 12     # The number of lines to draw
    length: 7     # The length of each line
    width: 9      # The line thickness
    radius: 30    # The radius of the inner circle
    color: '#000' # #rgb or #rrggbb
    speed: 1      # Rounds per second
    trail: 60     # Afterglow percentage
    shadow: false # Whether to render a shadow

  $.get "/posts", (data) ->
    $("#blog-posts").html data['html']

$(document).ready(ready)
$(document).on('page:load', ready)