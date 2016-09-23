require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Impact
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.active_record.raise_in_transactional_callbacks = true
    config.assets.enabled = true
    config.encoding = 'utf-8'

    config.before_configuration do
      env_file = File.join(Rails.root, 'config', 'local_env.yml')
      YAML.load(File.open(env_file)).each do |key, value|
        ENV[key.to_s] = value
      end if File.exists?(env_file)
    end

    config.assets.precompile += [ 'appviews.css', 'archives.css', 'cssanimations.css', 'dashboards.css', 'digital_transformation.css', 'forms.css', 'gallery.css', 'graphs.css', 'mailbox.css', 'miscellaneous.css', 'outgoing_exchange.css', 'pages.css', 'tables.css', 'uielements.css', 'widgets.css', 'files.css' ]
    config.assets.precompile += [ 'appviews.js',  'archives.js', 'cssanimations.js', 'dashboards.js', 'digital_transformation.js', 'forms.js', 'gallery.js', 'graphs.js', 'mailbox.js', 'miscellaneous.js', 'outgoing_exchange.js', 'pages.js', 'tables.js', 'uielements.js', 'widgets.js', 'files.js' ]
    config.autoload_paths += %W(#{config.root}/lib)
  end
end
