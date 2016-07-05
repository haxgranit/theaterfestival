# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$ ->
  artists = new Bloodhound(
    datumTokenizer: Bloodhound.tokenizers.obj.whitespace('name')
    queryTokenizer: Bloodhound.tokenizers.whitespace
    remote:
      url: '/theaters/autocomplete?query=%QUERY'
      wildcard: '%QUERY')
  artists.initialize()
  $('#theater_name').typeahead null,
    displayKey: 'name'
    source: artists.ttAdapter()
  return
