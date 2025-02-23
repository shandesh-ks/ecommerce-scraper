# frozen_string_literal: true

require_relative 'boot'

require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'active_storage/engine'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_mailbox/engine'
# require "action_text/engine"
require 'action_view/railtie'
require 'action_cable/engine'
require 'sprockets/railtie'
require 'rails/test_unit/railtie'
require 'newrelic_rpm'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module EcommerceScraper
  class Application < Rails::Application
    config.middleware.use Rack::Attack
    # ###################################################################### #
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    # ###################################################################### #

    # ###################################################################### #
    # BASIC CONFIGURATION: Common configuration for Rails itself
    # ###################################################################### #
    # #### #
    # Initialize configuration defaults for originally generated Rails version.
    # #### #
    # Add the custom error handling middleware
    config.load_defaults 7.0

    # config.mongoid.logger = Logger.new($stdout, :warn)
    config.mongoid.preload_models = false
    config.mongoid.logger.level = Logger::INFO
    # #### #
    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    # #### #
    config.api_only = false
    config.generators do |g|
      g.orm :active_record
      g.javascripts false
      g.stylesheets false
      g.helper false
      g.channel assets: false
    end

    # #### #
    # Add lib to autoload paths
    # Also add it to eager_load_paths for non-production environments
    # #### #
    config.autoload_paths << "#{Rails.root}/lib/swagger"
    config.autoload_paths << Rails.root.join('lib')
    config.eager_load_paths += %W(
      #{Rails.root}/lib
      #{Rails.root}/lib/swagger
      #{Rails.root}/lib/swagger/docs
      #{Rails.root}/lib/swagger/schemas
      #{Rails.root}/app/controllers/concerns/activity_feed/
    )

    # ###################################################################### #
    # CUSTOM CONFIGURATION: Configuration for other gems and libraries used
    # ###################################################################### #
    @rails_env = ENV['RAILS_ENV'] || 'development'
    #config.hosts << "827d71f649ed.ngrok.io"


    config.crypt = ActiveSupport::MessageEncryptor.new(secret_key_base[0..31], secret_key_base)
    case @rails_env
    when 'production'
      config.ipro_api_key_secret_name = 'production_ipro_api_key_secret'
    when 'uat'
      config.ipro_api_key_secret_name = 'sandbox_ipro_api_key_secret'
    when 'preprod'
      config.ipro_api_key_secret_name = 'preprod_ipro_api_key_secret'
    when 'test'
      config.ipro_api_key_secret_name = 'test_ipro_api_key_secret'
    when 'devtest'
      config.ipro_api_key_secret_name = 'devtest_ipro_api_key_secret'
    when 'development'
      config.ipro_api_key_secret_name = 'dev_ipro_api_key_secret'
    when 'qa'
      config.ipro_api_key_secret_name = 'qa_ipro_api_key_secret'
    else
      raise "Application configuration error: Environment '#{@rails_env}' is unknown!"
    end
    config.active_job.queue_adapter = :delayed
    config.action_controller.raise_on_open_redirects = false
  end
end
