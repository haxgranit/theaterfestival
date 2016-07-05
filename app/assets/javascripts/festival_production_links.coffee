# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  festivals = new Bloodhound(
    datumTokenizer: Bloodhound.tokenizers.obj.whitespace('title')
    queryTokenizer: Bloodhound.tokenizers.whitespace
    remote:
      url: '/festivals/autocomplete?query=%QUERY'
      wildcard: '%QUERY')
  festivals.initialize()
  $('[id*=festival_id]').typeahead null,
    displayKey: 'title'
    source: festivals.ttAdapter()
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
