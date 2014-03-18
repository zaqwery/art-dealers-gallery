# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(window).load ->

  $ ->
    $(".thumb_container").draggable({ containment: 'document', scroll: false, zIndex: 5 })

  $('.background').fullBg()
  #console.log(id)

#  $('.thumb').on 'ajax:success', (event, data, status, xhr) ->
#    thisId = $(this).attr('data-id')
#    bg = $('.background')
#    imgPath = data.image_bg
#    artistAvatar = $(".artist_avatar")
#    aristInfo = $(".artist_info")
#    artistId = data.image.artist.id
#    $('.artist_name').text(data.image.artist.name)
#    $('.image_name').text(data.image.name)
#    $('.image_dims').text(data.image.dimensions)
#    $(".background").detach()
#    $("<img class='background'>").appendTo('#container').attr({src: imgPath, 'data-id': artistId}).fullBg()
  Layout =
    config:
      effectIn: 'fadeIn'
      effectOut: 'fadeOut'
      speed: 300
    init: ->

      $('.thumb').on 'ajax:success', @changeData
#      $('.thumb').on 'ajax:complete', @changeBg
    changeData: (event, data, status, xhr) ->
#      alert(data.image.artist.name)
      artistName = $(this).attr('data-artist')
      bg = $('.background')
      config = Layout.config
      effectIn = config.effectIn
      effectOut = config.effectOut
      speed = config.speed
      imgPath = data.image_bg
#      artistAvatar = $(".artist_avatar")
#      aristInfo = $(".artist_info")
#      artistId = data.image.artist.id
      $('.artist_name').text(data.image.artist.name)
      $('.artist_name').attr({'href': 'artists/' + artistName})
      $('.image_name').text(data.image.name)
      $('.image_dims').text(data.image.dimensions)
      $(".background")[effectOut](speed).detach()
      $("<img class='background'>").appendTo('body').attr({src: imgPath, 'data-artist': artistName}).load ->
        $(this).fullBg()
#      event.preventDefault()
#    changeBg: (xhr, status) ->
#      $('.background')
#      artistAvatar.find('img').attr({src: artistAvatarPath})
#      artistAvatar.find('span').text(data.image.artist.name)


#      hiddenBg = $('.background:hidden').filter("#" + thisId)
#
#      if hiddenBg.length
#        bg[effectOut](speed)
#        hiddenBg[effectIn](speed)
#      else if bg.attr('id') == thisId
#      else
#        bg[effectOut](speed)
#        $("<img class='background'>").attr({src: imgPath}).appendTo('#container').fullBg()

  Layout.init()
