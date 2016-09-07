$ ->
  $(document).on 'turbolinks:load cocoon:after-insert', ->
    $('input[type="file"]').ezdz()
