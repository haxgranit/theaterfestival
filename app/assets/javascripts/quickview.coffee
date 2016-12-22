$ ->
 $(document).on 'turbolinks:load ajax:complete', ->
  #final width --> this is the quick view image slider width
  #maxQuickWidth --> this is the max-width of the quick-view panel
  sliderFinalWidth = 400
  maxQuickWidth = 900
  #open the quick view panel

  updateSlider = (navigation) ->
    sliderConatiner = navigation.parents('.cd-slider-wrapper').find('.cd-slider')
    activeSlider = sliderConatiner.children('.selected').removeClass('selected')
    if navigation.hasClass('cd-next')
      if !activeSlider.is(':last-child') then activeSlider.next().addClass('selected') else sliderConatiner.children('li').eq(0).addClass('selected')
    else
      if !activeSlider.is(':first-child') then activeSlider.prev().addClass('selected') else sliderConatiner.children('li').last().addClass('selected')
    return

  updateQuickView = (url) ->
    $('.cd-quick-view .cd-slider li').removeClass('selected').find('img[src="' + url + '"]').parent('li').addClass 'selected'
    return

  resizeQuickView = ->
    quickViewLeft = ($(window).width() - $('.cd-quick-view').width()) / 2
    quickViewTop = ($(window).height() - $('.cd-quick-view').height()) / 2
    $('.cd-quick-view').css
      'top': quickViewTop
      'left': quickViewLeft
    return

  closeQuickView = (finalWidth, maxQuickWidth) ->
    close = $('.cd-close')
    activeSliderUrl = close.siblings('.cd-slider-wrapper').find('.selected img').attr('src')
    selectedImage = $('.empty-box').find('img')
    #update the image in the gallery
    if !$('.cd-quick-view').hasClass('velocity-animating') and $('.cd-quick-view').hasClass('add-content')
      selectedImage.attr 'src', activeSliderUrl
      animateQuickView selectedImage, finalWidth, maxQuickWidth, 'close'
    else
      closeNoAnimation selectedImage, finalWidth, maxQuickWidth
    return

  animateQuickView = (image, finalWidth, maxQuickWidth, animationType) ->
    #store some image data (width, top position, ...)
    #store window data to calculate quick view panel position
    parentListItem = image.parent('.cd-item')
    topSelected = image.offset().top - $(window).scrollTop()
    leftSelected = image.offset().left
    widthSelected = image.width()
    heightSelected = image.height()
    windowWidth = $(window).width()
    windowHeight = $(window).height()
    finalLeft = (windowWidth - finalWidth) / 2
    finalHeight = finalWidth * heightSelected / widthSelected
    finalTop = (windowHeight - finalHeight) / 2
    quickViewWidth = if windowWidth * .8 < maxQuickWidth then windowWidth * .8 else maxQuickWidth
    quickViewLeft = (windowWidth - quickViewWidth) / 2
    if animationType == 'open'
      #hide the image in the gallery
      parentListItem.addClass 'empty-box'
      #place the quick view over the image gallery and give it the dimension of the gallery image
      $('.cd-quick-view').css(
        'top': topSelected
        'left': leftSelected
        'width': widthSelected).velocity({
        'top': 0
        'bottom': 0
        'left': finalLeft + 'px'
        'width': finalWidth + 'px'
      }, 1000, [
        400
        20
      ], ->
        #animate the quick view: animate its width to the final value
        $('.cd-quick-view').addClass('animate-width').velocity {
          'left': quickViewLeft + 'px'
          'width': quickViewWidth + 'px'
        }, 300, 'ease', ->
          #show quick view content
          $('.cd-quick-view').addClass 'add-content'
          return
        return
      ).addClass 'is-visible'
    else
      #close the quick view reverting the animation
      $('.cd-quick-view').removeClass('add-content').velocity {
        'top': 0
        'left': finalLeft + 'px'
        'width': finalWidth + 'px'
      }, 300, 'ease', ->
        $('body').removeClass 'overlay-layer'
        $('.cd-quick-view').removeClass('animate-width').velocity {
          'top': topSelected
          'left': leftSelected
          'width': widthSelected
        }, 500, 'ease', ->
          $('.cd-quick-view').removeClass 'is-visible'
          parentListItem.removeClass 'empty-box'
          return
        return
    return

  closeNoAnimation = (image, finalWidth, maxQuickWidth) ->
    parentListItem = image.parent('.cd-item')
    topSelected = image.offset().top - $(window).scrollTop()
    leftSelected = image.offset().left
    widthSelected = image.width()
    #close the quick view reverting the animation
    $('body').removeClass 'overlay-layer'
    parentListItem.removeClass 'empty-box'
    $('.cd-quick-view').velocity('stop').removeClass('add-content animate-width is-visible').css
      'top': topSelected
      'left': leftSelected
      'width': widthSelected
    return

  $('.cd-trigger').on 'click', (event) ->
    selectedImage = $(this).parent('.cd-item').children('img')
    slectedImageUrl = selectedImage.attr('src')
    productionId = $(this).parent('.cd-item').data('production')
    festivalId = $(this).parent('.cd-item').data('festival')
    $('body').addClass 'overlay-layer'
    animateQuickView selectedImage, sliderFinalWidth, maxQuickWidth, 'open'
    #update the visible slider image in the quick view panel
    #you don't need to implement/use the updateQuickView if retrieving the quick view data with ajax
    if productionId?
      $.get '/productions/' + productionId + '/quickview', ((data) ->
        $('.cd-quick-view').html data
        return
      ), 'html'
    if festivalId?
      $.get '/festivals/' + festivalId + '/quickview', ((data) ->
        $('.cd-quick-view').html data
        return
      ), 'html'
    return
  #close the quick view panel
  $('body').on 'click', (event) ->
    if $(event.target).is('.cd-close') or $(event.target).is('body.overlay-layer')
      closeQuickView sliderFinalWidth, maxQuickWidth
    return
  $(document).keyup (event) ->
    #check if user has pressed 'Esc'
    if event.which == '27'
      closeQuickView sliderFinalWidth, maxQuickWidth
    return
  #quick view slider implementation
  $('.cd-quick-view').on 'click', '.cd-slider-navigation a', ->
    updateSlider $(this)
    return
  #center quick-view on window resize
  $(window).on 'resize', ->
    if $('.cd-quick-view').hasClass('is-visible')
      window.requestAnimationFrame resizeQuickView
    return
  return

