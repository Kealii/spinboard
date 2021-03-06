Rails.application.configure do
  config.cache_classes = true
  config.eager_load = true
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true
  config.serve_static_files = ENV['RAILS_SERVE_STATIC_FILES'].present?
  config.assets.js_compressor = :uglifier
  config.assets.compile = false
  config.assets.digest = true
  config.log_level = :debug
  config.i18n.fallbacks = true
  config.active_support.deprecation = :notify
  config.log_formatter = ::Logger::Formatter.new# Do not dump schema after migrations.
  config.active_record.dump_schema_after_migration = false
  config.action_mailer.smtp_settings = {
      address: 'smtp.mandrillapp.com',
      port: 587,
      user_name: ENV['MANDRILL_USERNAME'],
      enable_starttls_auto: true,
      password: ENV['MANDRILL_KEY'],
      authentication: 'plain',
      domain: 'example.com'
  }
end
