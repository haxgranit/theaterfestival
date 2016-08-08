# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $(document).on 'turbolinks:load', ->
    $('#price_range').slider
      tooltip: 'always'
      formatter: (value) ->
        '$' + value[0] + ' - ' + value[1]
    return
