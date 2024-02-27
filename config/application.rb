require_relative "boot"

require "rails/all"

require 'boletosimples'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TesteBoleto
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1


    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w(assets tasks))

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    BoletoSimples.configure do |c|
      c.environment = :production # defaut :sandbox
      # production - https://app.kobana.com.br/conta/api/tokens
      # sandbox - https://app-sandbox.kobana.com.br/conta/api/tokens
      c.api_token = ENV['BOLETOSIMPLES_API_TOKEN']
      c.user_agent = 'brunolima.dev703@gmail.com' #Colocar um e-mail válido para contatos técnicos relacionado ao uso da API.
      # c.debug = true
      # c.custom_headers = { 'X-CUSTOM' => 'CONTENT' }
      # c.cache = ActiveSupport::Cache.lookup_store(:mem_cache_store, ['localhost:3000'],
      #                                         namespace: 'boletosimples_client',
      #                                         compress: true)
    end
  end
end
