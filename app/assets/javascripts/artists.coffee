# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$ ->
  artists = new Bloodhound(
    datumTokenizer: Bloodhound.tokenizers.obj.whitespace('stage_name')
    queryTokenizer: Bloodhound.tokenizers.whitespace
    remote:
      url: '/artists/autocomplete?query=%QUERY'
      wildcard: '%QUERY')
  artists.initialize()
  $('#artist_stage_name').typeahead null,
    displayKey: 'stage_name'
    source: artists.ttAdapter()
  return
