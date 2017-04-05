// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require tether
//= require bootstrap
//= require bootstrap-slider
//= require moment
//= require bootstrap-datetimepicker
//= require pickers
//= require twitter/typeahead.min
//= require lightbox
//= require handlebars
//= require cocoon
//= require js-routes
//= require refile
//= require select2-full
//= require best_in_place
//= require ckeditor/init
//= require jquery-fileupload
//= require gmaps-auto-complete
//= require_tree .

$(function() {
    return $(document).on('ready turbolinks:load ajax:complete', function() {
        jQuery('.actions').hide();
        jQuery('.links .add_fields').click(function () { jQuery('.actions').show(); });
        jQuery(".best_in_place").best_in_place();
        $.ajaxSetup({
            headers: {
                'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
            }
        });
        jQuery(function() {
          var completer;

          completer = new GmapsCompleter({
            inputField: '.gmaps-input-address',
            errorField: '#gmaps-error'
          });

          completer.autoCompleteInit({
            country: "us"
          });
        });
    });
});
