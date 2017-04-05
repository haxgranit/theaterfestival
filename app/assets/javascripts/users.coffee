# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $(document).on 'ready turbolinks:load', ->
    $('#password-strength').zxcvbnProgressBar();

    $(document).on "upload:start", "form", (e) ->
        $(this).find("input[type=submit]").attr "disabled", true
        $("#progress-bar").slideDown('fast')

    $(document).on "upload:progress", "form", (e) ->
      detail          = e.originalEvent.detail.progress
      percentComplete = Math.round(detail.loaded / detail.total * 100)
      $('.progress-bar').width("#{percentComplete}%")
      $("#progress-bar-text").text("#{percentComplete}% Complete")

    $(document).on "upload:success", "form", (e) ->
      file = e.target.files[0]
      fr = new FileReader
      fr.onload = (e) ->
        console.log(e)
        $(this).find("img").attr('src', fr.result)
      fr.readAsDataURL file
      console.log(fr)
      $(this).find("input[type=submit]").removeAttr "disabled"  unless $(this).find("input.uploading").length
      $("#progress-bar").slideUp('fast')
    return
