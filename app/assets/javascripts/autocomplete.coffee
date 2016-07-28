$ ->
  artists = new Bloodhound(
    datumTokenizer: Bloodhound.tokenizers.obj.whitespace('stage_name', 'value', 'shows')
    queryTokenizer: Bloodhound.tokenizers.whitespace
    remote:
      url: '/artists/autocomplete?query=%QUERY'
      wildcard: '%QUERY')

  artists.initialize()

  $('#stage_name').typeahead({
    hint: true
    highlight: true
    minLength: 2
  },
    name: 'result'
    displayKey: 'stage_name'
    templates:
      suggestion: (data) ->
        credits = (data) ->
          markup = ''
          $.each data.credits, (i,val) ->
            markup += '<li>' + val.production + ' - ' + val.position + '</li>'
          markup
        result = '<div class="results"><p><strong>' \
                + data.stage_name \
                + '</strong></p><ul>' \
                + credits(data) \
                + '</ul></div>'
        result
    source: artists.ttAdapter()).bind 'typeahead:selected', (ev, suggestion) ->
      $('[id$=credit_artist_id').val(suggestion.value)
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
