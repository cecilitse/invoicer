::Sass.load_paths << File.join(root, 'node_modules')

activate :bower
activate :i18n

set :css_dir,     'stylesheets'
set :js_dir,      'javascripts'
set :images_dir,  'images'
