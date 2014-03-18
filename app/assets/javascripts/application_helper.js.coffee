(($) ->
  $.fn.fullBg = ->
    resizeImg = ->
      imgwidth = bgImg.width()
      imgheight = bgImg.height()
      winwidth = $(window).width()
      winheight = $(window).height()
      widthratio = winwidth / imgwidth
      heightratio = winheight / imgheight
      widthdiff = heightratio * imgwidth
      heightdiff = widthratio * imgheight
      if heightdiff > winheight
        bgImg.css
          height: heightdiff + "px"
          width: winwidth + "px"
      else
        bgImg.css
          height: winheight + "px"
          width: widthdiff + "px"


    bgImg = $(this)
    resizeImg()
    $(window).resize ->
      resizeImg()

) jQuery