$ ->
  $(document).on 'turbolinks:load cocoon:after-insert ajax:complete', ->
    $('select').select2
      theme: "classic"
      tags: true

    Handlebars.registerHelper 'route_to', (route, resource_id, caption) ->
      url = Routes[route](resource_id)
      new (Handlebars.SafeString)('<a href=\'' + url + '\'>' + caption + '</a>')

    Handlebars.registerHelper 'url_to', (route, resource_id, caption) ->
      url = Routes[route](resource_id)
      new (Handlebars.SafeString)(url)

    agg = new Bloodhound(
      datumTokenizer: Bloodhound.tokenizers.obj.whitespace('name', 'value', 'image')
      queryTokenizer: Bloodhound.tokenizers.whitespace
      remote:
        url: '/search/autocomplete?query=%QUERY'
        wildcard: '%QUERY')

    agg.initialize()

    $('#name.fake').typeahead({
      hint: true
      highlight: true
      minLength: 2
    },
      displayKey: 'name'
      templates:
        suggestion: Handlebars.compile("
	    <a href=\"{{path}}\">
            <div class=\"results row\">
              {{#if image}}
              <div class=\"col-md-3\">
                <img src=\"{{image}}\">
              </div>
              {{/if}}
              {{#if name}}
		      <div class=\"col-md-9\">
			<strong>{{name}}</strong>
		      {{#if credits}}
			<ul>
			  {{#each credits}}
			  <li>{{production}} - {{position}}</li>
			  {{/each}}
			</ul>
		      {{/if}}
		      </div>
              {{/if}}
            </div>
	    </a>
          ")
      source: agg.ttAdapter()).bind 'typeahead:selected', (ev, suggestion) ->
        $('[id$=user_id]').val(suggestion.value)
        return
  $(document).on 'turbolinks:load cocoon:after-insert ajax:complete', ->
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




  $(document).on 'turbolinks:load cocoon:after-insert ajax:complete', (e, added_item) ->
    artists = new Bloodhound(
      datumTokenizer: Bloodhound.tokenizers.obj.whitespace('stage_name', 'value', 'credits')
      queryTokenizer: Bloodhound.tokenizers.whitespace
      remote:
        url: '/artists/autocomplete?query=%QUERY'
        wildcard: '%QUERY')

    artists.initialize()

    $('#stage_name.fake, [id$=_stage_name]').typeahead({
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
        added_item.find('[id$=artist_id]').val(suggestion.value)
        return


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


  $(document).on 'turbolinks:load cocoon:after-insert ajax:complete', (e, added_item) ->
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

    $('#showtimes #title.fake, .nested-fields [id$=title]').typeahead({
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
                <strong>{{title}}</strong> This worked
              {{/if}}
              {{#if company}}
                  - {{company.name}}
              {{/if}}
              </p>
            </div>
          ")
      source: productions.ttAdapter()).bind 'typeahead:selected', (ev, suggestion) ->
        added_item.find('[id$=production_id]').val(suggestion.value)
        return



  $(document).on 'turbolinks:load cocoon:after-insert ajax:complete', ->
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

  $(document).on 'turbolinks:load cocoon:after-insert ajax:complete', ->
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


    $(document).on 'turbolinks:load cocoon:after-insert ajax:complete', ->
      theaters = new Bloodhound(
        datumTokenizer: Bloodhound.tokenizers.obj.whitespace('name', 'value')
        queryTokenizer: Bloodhound.tokenizers.whitespace
        remote:
          url: '/venues/autocomplete?query=%QUERY'
          wildcard: '%QUERY')

      theaters.initialize()

      $('[id$=venue]').typeahead({
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
        source: theaters.ttAdapter()).bind 'typeahead:selected', (ev, suggestion) ->
          here = $(this).closest('.row')
          here.find('[id$=venue_id]').val(suggestion.value)
          venue_info(here, suggestion.value)

  venue_info = (el, venue) ->
    console.log el
    $.ajax(
      url: '/api/v1/venues/' + venue
      type: 'GET').done((data, textStatus, jqXHR) ->
        console.log 'HTTP Request Succeeded: ' + jqXHR.status
        el.find('[id$=address]').val(data.data.attributes.address)
        return
    ).fail((jqXHR, textStatus, errorThrown) ->
      console.log 'HTTP Request Failed'
      return
    ).always ->
      return

    $.ajax(
      url: '/api/v1/venues/' + venue + '/theaters/'
      type: 'GET').done((data, textStatus, jqXHR) ->
        console.log 'HTTP Request Succeeded: ' + jqXHR.status
        $.each data.data, (index, value) ->
          el.find('[id$=_theater_id]').html ''
          console.log(value)
          el.find('[id$=_theater_id]').append $('<option>',
              value: value.id
              text: value.attributes.name)
          return
    ).fail((jqXHR, textStatus, errorThrown) ->
      console.log 'HTTP Request Failed'
      return
    ).always ->
      return

    el.find('select').select2
      theme: "classic"
      tags: true

  return

  formatTheaterSelection = (theater) ->
    theater.name

  formatTheater = (theater) ->
    markup = '<div class=\'select2-result-repository clearfix\'>' + '<div class=\'select2-result-repository__meta\'>' + '<div class=\'select2-result-repository__title\'>' + theater.name + '</div>'
    markup

