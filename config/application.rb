require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Tiktaktoe
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1
    config.secret_key_base = "1897f1d27d240f88c2961cd4fde10e4dfeae26e8bcea280209673ce8c705243f40dff54ae8e384d66a35588c0dad473b037373cbce0c849b4b1f002721a19343"
    config.skip_session_storage = [:http_auth, :token_auth]
    # Configuration for the application, engines, and railties goes here.
    config.autoload_paths += %W(#{config.root}/app/services)
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    config.hosts << "192.168.1.6"
    config.hosts << "192.168.1.3"
    config.hosts << "192.168.1.4"
    config.hosts << "192.168.10.100"
    config.hosts << "192.168.1.9"
    config.hosts << "192.168.1.5"
    # config.action_cable.allowed_request_origins = ['http://192.168.10.100:3001/','http://192.168.1.3:8081/','http://192.168.1.9:8081/','http://192.168.1.5:3002/']
    config.hosts << "192.168.1.19"
    config.hosts << "172.26.10.24"
    config.hosts << "15.206.26.154"
    config.hosts << "192.168.29.101"
    config.hosts << "192.168.29.13"
    config.hosts << "tiktaktoe-backend.notmaniac.com"
    config.hosts << "tiktaktoe-backend.chintamanipatil.in"
    config.action_cable.allowed_request_origins = ['http://192.168.1.19:3002/','http://192.168.10.100:3001/','http://192.168.1.3:8081/','http://192.168.1.9:8081/','http://192.168.1.5:3002/','http://15.206.26.154:3002/',"http://tiktaktoe.notmaniac.com/","http://192.168.29.101:3002","http://tiktaktoe.chintamanipatil.in"]

    # expose_headers = ['Access-Token', 'Uid','Client','Token-Type','Expiry', 'Authorization']
    #
    # config.middleware.use Rack::Cors do
    #
    #   allow do
    #     origins 'http://192.168.1.5:3002'
    #     resource '*',
    #              headers: :any,
    #              methods: :any,
    #              expose: expose_headers,
    #              credentials: false
    #   end
    #
    #   allow do
    #     origins '*'
    #     resource '/*', :headers => :any, :methods => [:get, :post, :options]
    #   end
    # end
  end
end


