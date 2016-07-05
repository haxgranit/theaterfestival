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
  $('[id*=artist_id]').typeahead null,
    displayKey: 'stage_name'
    source: artists.ttAdapter()
  return

$ ->
  productions = new Bloodhound(
    datumTokenizer: Bloodhound.tokenizers.obj.whitespace('title')
    queryTokenizer: Bloodhound.tokenizers.whitespace
    remote:
      url: '/productions/autocomplete?query=%QUERY'
      wildcard: '%QUERY')
  productions.initialize()
  $('[id*=production_id]').typeahead null,
    displayKey: 'title'
    source: productions.ttAdapter()
  return
