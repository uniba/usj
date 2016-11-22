
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

ignore 'templates/*'
ignore 'javascripts/**/*.js'
ignore '!javascripts/*.js'

set :relative_links, true

activate :relative_assets
activate :directory_indexes
activate :automatic_image_sizes

activate :external_pipeline,
  name: :webpack,
  command: build? ? 'npm run build' : 'npm run watch',
  source: '.tmp/dist'

activate :autoprefixer do |config|
  config.browsers = ['last 2 versions']
  config.inline = true
end

activate :deploy do |deploy|
  deploy.deploy_method = :ftp
  deploy.host = ENV['DEPLOY_FTP_HOST']
  deploy.path = ENV['DEPLOY_FTP_PATH']
  deploy.user = ENV['DEPLOY_FTP_USER']
  deploy.password = ENV['DEPLOY_FTP_PASSWORD']
end

helpers do
end

configure :development do
  activate :livereload,
    no_swf: true,
    ignore: [/javascripts\/.*\.map$/]
end

configure :build do
  ignore 'javascripts/*.map'

  activate :minify_css
  activate :asset_hash
end
