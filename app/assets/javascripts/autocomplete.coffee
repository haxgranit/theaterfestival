$ ->
  users = new Bloodhound(
    datumTokenizer: Bloodhound.tokenizers.obj.whitespace('full_name', 'value', 'email')
    queryTokenizer: Bloodhound.tokenizers.whitespace
    remote:
      url: '/users/autocomplete?query=%QUERY'
      wildcard: '%QUERY')

  users.initialize()

  $('#user.fake').typeahead({
    hint: true
    highlight: true
    minLength: 2
  },
    displayKey: 'full_name'
    templates:
      suggestion: Handlebars.compile("
          <div class=\"results\">
            <p>
            {{#if full_name}}
              <strong>{{full_name}}</strong>
            {{/if}}
            -
            {{#if email}}
              <strong>{{email}}</strong>
            {{/if}}
            </p>
          </div>
        ")
    source: users.ttAdapter()).bind 'typeahead:selected', (ev, suggestion) ->
      $('[id$=user_id]').val(suggestion.value)
      return




$ ->
  artists = new Bloodhound(
    datumTokenizer: Bloodhound.tokenizers.obj.whitespace('stage_name', 'value', 'credits')
    queryTokenizer: Bloodhound.tokenizers.whitespace
    remote:
      url: '/artists/autocomplete?query=%QUERY'
      wildcard: '%QUERY')

  artists.initialize()

  $('form[id$=credit] #stage_name').typeahead({
    hint: true
    highlight: true
    minLength: 2
  },
    displayKey: 'stage_name'
    templates:
      suggestion: Handlebars.compile("
          <div class=\"results\">
            <p>
            {{#if stage_name}}
              <strong>{{stage_name}}</strong>
            {{/if}}
            {{#if credits}}
              <ul>
                {{#each credits}}
                <li>{{production}} - {{position}}</li>
                {{/each}}
              </ul>
            {{/if}}
            </p>
          </div>
        ")
    source: artists.ttAdapter()).bind 'typeahead:selected', (ev, suggestion) ->
      $('[id$=credit_artist_id').val(suggestion.value)
      return

  Handlebars.registerHelper 'route_to', (route, resource_id, caption) ->
    url = Routes[route](resource_id)
    new (Handlebars.SafeString)('<a href=\'' + url + '\'>' + caption + '</a>')

  $('form#new_artist #artist_stage_name').typeahead null,
    displayKey: 'stage_name'
    templates:
      suggestion: Handlebars.compile([
          '<div class="results">',
            '{{#if stage_name}}',
              '<strong>{{stage_name}}</strong>',
            '{{/if}}',
            '{{#if credits}}',
              '<ul>',
                '{{#each credits}}',
                '<li>{{production}} - {{position}}</li>',
                '{{/each}}',
              '</ul>',
            '{{/if}}',
            '{{{route_to "artist_path" value "Is This you?"}}}',
          '</div>'
        ].join('\n'))
    source: artists.ttAdapter()


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
