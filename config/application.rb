require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module NewsChat
  class Application < Rails::Application
    # create_at, update_atを日本時間に
    config.i18n.default_locale = :ja
    config.time_zone = 'Tokyo'
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    # field_with_errorsの自動挿入制御
    config.action_view.field_error_proc = proc { |html_tag, _instance| html_tag }
  end
end
