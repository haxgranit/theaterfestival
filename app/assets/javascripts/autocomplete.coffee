$ ->
  $(document).on 'turbolinks:load cocoon:after-insert', ->
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




  $(document).on 'turbolinks:load cocoon:after-insert', ->
    artists = new Bloodhound(
      datumTokenizer: Bloodhound.tokenizers.obj.whitespace('stage_name', 'value', 'credits')
      queryTokenizer: Bloodhound.tokenizers.whitespace
      remote:
        url: '/artists/autocomplete?query=%QUERY'
        wildcard: '%QUERY')

    artists.initialize()

    $('#stage_name.fake').typeahead({
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
        $('[id$=artist_id]').val(suggestion.value)
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


  $(document).on 'turbolinks:load cocoon:after-insert', (e, added_item) ->
    testing = added_item
    console.log(testing)
    productions = new Bloodhound(
      datumTokenizer: Bloodhound.tokenizers.obj.whitespace('title', 'value', 'company')
      queryTokenizer: Bloodhound.tokenizers.whitespace
      remote:
        url: '/productions/autocomplete?query=%QUERY'
        wildcard: '%QUERY')

    productions.initialize();

    $('#title.fake').typeahead({
      hint: true
      highlight: true
      minLength: 2
    },
      displayKey: 'title'
      templates:
        suggestion: Handlebars.compile("
            <div class=\"results\">
              <p>
              {{#if title}}
                <strong>{{title}}</strong>
              {{/if}}
              {{#if company}}
                  - {{company.name}}
              {{/if}}
              </p>
            </div>
          ")
      source: productions.ttAdapter()).bind 'typeahead:selected', (ev, suggestion) ->
        added_item.find('[id$=creditable_id]').val(suggestion.value)
        added_item.find('[id$=creditable_type]').val(suggestion.type)
        return

    $('[id$=title][id*=credits_attributes]').typeahead({
      hint: true
      highlight: true
      minLength: 2
    },
      displayKey: 'title'
      templates:
        suggestion: Handlebars.compile("
            <div class=\"results\">
              <p>
              {{#if title}}
                <strong>{{title}}</strong>
              {{/if}}
              {{#if company}}
                  - {{company.name}}
              {{/if}}
              </p>
            </div>
          ")
      source: productions.ttAdapter()).bind 'typeahead:selected', (ev, suggestion) ->
        added_item.find('[id$=creditable_id]').val(suggestion.value)
        added_item.find('[id$=creditable_type]').val(suggestion.type)
        return



  $(document).on 'turbolinks:load cocoon:after-insert', ->
    companies = new Bloodhound(
      datumTokenizer: Bloodhound.tokenizers.obj.whitespace('name', 'value')
      queryTokenizer: Bloodhound.tokenizers.whitespace
      remote:
        url: '/companies/autocomplete?query=%QUERY'
        wildcard: '%QUERY')

    companies.initialize()

    $('#company.fake').typeahead({
      hint: true
      highlight: true
      minLength: 2
    },
      displayKey: 'name'
      templates:
        suggestion: Handlebars.compile("
            <div class=\"results\">
              <p>
              {{#if name}}
                <strong>{{name}}</strong>
              {{/if}}
              </p>
            </div>
          ")
      source: companies.ttAdapter()).bind 'typeahead:selected', (ev, suggestion) ->
        $('[id$=company_id]').val(suggestion.value)
        return

  $(document).on 'turbolinks:load cocoon:after-insert', ->
    theaters = new Bloodhound(
      datumTokenizer: Bloodhound.tokenizers.obj.whitespace('name', 'value', 'venue')
      queryTokenizer: Bloodhound.tokenizers.whitespace
      remote:
        url: '/theaters/autocomplete?query=%QUERY'
        wildcard: '%QUERY')

    theaters.initialize()

    $('#theater.fake').typeahead({
      hint: true
      highlight: true
      minLength: 2
    },
      displayKey: 'name'
      templates:
        suggestion: Handlebars.compile("
            <div class=\"results\">
              <p>
              {{#if name}}
                <strong>{{name}}</strong>
              {{/if}}
              {{#if venue}}
                - {{venue}}
              {{/if}}
              </p>
            </div>
          ")
      source: theaters.ttAdapter()).bind 'typeahead:selected', (ev, suggestion) ->
        $('[id$=theater_id]').val(suggestion.value)
        return
