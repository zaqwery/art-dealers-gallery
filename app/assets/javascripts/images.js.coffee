# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  $(".artists li").draggable()
  $(".artist_droppable").droppable 
    #accept: ".artist li"     
    drop: (event, ui) ->
      ui = $(ui.draggable)
      artist_name = ui.text()
      artist_id = ui.find(':hidden').attr('value')
      if $(this).find('p').length == 0 then $('<p></p>').text(artist_name).appendTo(this) else $(this).find('p').text(artist_name) 
      $(this).find(':hidden').attr('value',  artist_id)
