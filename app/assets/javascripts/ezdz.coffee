$ ->
  $(document).on 'turbolinks:load cocoon:after-insert', ->
    $('input[type="file"]').each (ix) ->
      $(this).ezdz()
      return
