# frozen_string_literal: true

Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports.
  config.consider_all_requests_local = true

  # Enable/disable caching. By default caching is disabled.
  # Run rails dev:cache to toggle caching.
  if Rails.root.join('tmp', 'caching-dev.txt').exist?
    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.to_i}"
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :memory_store
    # config.cache_store = :redis_cache_store, { url: ENV['REDIS_URL'], expires_in: 1.month }
    # config.cache_store = :redis_cache_store, { url: "redis://10.217.61.68:6379/0", namespace: "myapp_cache", expires_in: 1.month }

  end

  config.action_dispatch.default_headers = {
    "Cross-Origin-Embedder-Policy" => "unsafe-none",
    "Cross-Origin-Opener-Policy" => "none",
    "Cross-Origin-Resource-Policy" => "same-origin",
    "Cache-Control" => "no-cache, no-store, must-revalidate",
    "Content-Security-Policy" => "script-src 'self' *.experience.com *.socialsurvey.com https://www.google.com https://www.gstatic.com https://js-agent.newrelic.com https://bam-cell.nr-data.net https://cdnjs.cloudflare.com 'unsafe-inline' 'unsafe-hashes'; object-src 'self' *.experience.com *.socialsurvey.com; base-uri 'self' ; frame-ancestors 'self';upgrade-insecure-requests;",
    "Referrer-Policy" => "strict-origin-when-cross-origin",
    "Strict-Transport-Security" => "max-age=31536000; includeSubdomains; preload",
    "Permissions-Policy" => "geolocation=(self), camera=(self), microphone=(self), autoplay=(self)",
    "X-Frame-Options" => "sameorigin",
    "X-XSS-Protection" => "1; mode=block",
    "X-Content-Type-Options" => "nosniff",
    "X-Permitted-Cross-Domain-Policies" => "none",
    "X-Download-Options" => "noopen"
  }
  # Store uploaded files on the local file system (see config/storage.yml for options).
  config.active_storage.service = :google

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  config.action_mailer.perform_caching = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = false #:page_load

  # Highlight code that triggered database queries in logs.
  config.active_record.verbose_query_logs = true

  # Raises error for missing translations.
  # config.action_view.raise_on_missing_translations = true

  # Use an evented file watcher to asynchronously detect changes in source code,
  # routes, locales, etc. This feature depends on the listen gem.
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker

  # multiple database switching ## Activating automatic connection switching ##
  config.active_record.database_selector = { delay: 2.seconds }
  config.active_record.database_resolver = ActiveRecord::Middleware::DatabaseSelector::Resolver
  config.active_record.database_resolver_context = ActiveRecord::Middleware::DatabaseSelector::Resolver::Session

  # ################################################################ #
  # Custom Development Environment settings
  # ################################################################ #
end
