# A sample Guardfile
# More info at https://github.com/guard/guard#readme

## Uncomment and set this to only include directories you want to watch
# directories %w(app lib config test spec features) \
#  .select{|d| Dir.exists?(d) ? d : UI.warning("Directory #{d} does not exist")}

## Note: if you are using the `directories` clause above and you are not
## watching the project directory ('.'), then you will want to move
## the Guardfile to a watched dir and symlink it back, e.g.
#
#  $ mkdir config
#  $ mv Guardfile config/
#  $ ln -s config/Guardfile .
#
# and, you'll have to watch "config/Guardfile" instead of "Guardfile"

guard :minitest, spring: true, all_on_start: false do
  watch(%r{^test/(.*)\/?test_(.*)\.rb$})
  watch(%r{^test/test_helper\.rb$}) { 'test' }
  watch('config/routes.rb')         { integration_tests }
  watch(%r{^app/models/(.*?)\.rb$}) { |m| "test/models/#{m[1]}_test.rb" }
  watch(%r{^app/controllers/(.*?)_controller\.rb$}) { |m| resource_tests(m[1]) }

  watch(%r{^app/views/([^/]*?)/.*\.html\.erb$}) do |m|
    ["test/controllers/#{m[1]}_controller_test.rb"] +
      integration_tests(m[1])
  end

  watch(%r{^app/helpers/(.*?)_helper\.rb$}) { |m| integration_tests(m[1]) }

  watch('app/views/layouts/application.html.erb') do
    'test/integration/site_layout_test.rb'
  end

  watch('app/helpers/sessions_helper.rb') do
    integration_tests << 'test/helpers/sessions_helper_test.rb'
  end

  watch('app/controllers/sessions_controller.rb') do
    ['test/controllers/sessions_controller_test.rb',
     'test/integration/users_login_test.rb']
  end

  watch('app/controllers/account_activations_controller.rb') do
    'test/integration/users_signup_test.rb'
  end

  watch(%r{app/views/users/*}) do
    resource_tests('users')
  end

  def integration_tests(resource = :all)
    if resource == :all
      Dir['test/integration/ * ']
    else
      Dir["test/integration/#{resource}_ * .rb"]
    end
  end

  def controller_test(resource)
    "test/controllers/#{resource}_controller_test.rb"
  end

  def resource_tests(resource)
    integration_tests(resource) << controller_test(resource)
  end

  watch(%r{^app/views/(.+)_mailer/.+}) { |m|
    "test/mailers/#{m[1]}_mailer_test.rb" }
  watch(%r{^lib/(.+)\.rb$}) { |m| "test/lib/#{m[1]}_test.rb" }
  watch(%r{^test/.+_test\.rb$})
end

guard 'livereload' do
  extensions = {
    css: :css,
    scss: :css,
    sass: :css,
    js: :js,
    coffee: :js,
    html: :html,
    png: :png,
    gif: :gif,
    jpg: :jpg,
    jpeg: :jpeg,
    # less: :less, # uncomment if you want LESS stylesheets done in browser
  }

  rails_view_exts = %w(erb haml slim)

  # file types LiveReload may optimize refresh for
  compiled_exts = extensions.values.uniq
  watch(%r{public/.+\.(#{compiled_exts * '|'})})

  extensions.each do |ext, type|
    watch(%r{
          (?:app|vendor)
          (?:/assets/\w+/(?<path>[^.]+) # path+base without extension
           (?<ext>\.#{ext})) # matching extension (must be first encountered)
          (?:\.\w+|$) # other extensions
          }x) do |m|
      path = m[1]
      "/assets/#{path}.#{type}"
    end
  end

  # file needing a full reload of the page anyway
  watch(%r{app/views/.+\.(#{rails_view_exts * '|'})$})
  watch(%r{app/helpers/.+\.rb})
  watch(%r{config/locales/.+\.yml})
end
