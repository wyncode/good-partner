require 'capybara'
require 'capybara-webkit'
Capybara.javascript_driver = :webkit

Capybara.configure do |config|
  config.run_server = false
  config.default_driver = :webkit
  config.app_host = 'https://localhost:3000' # change url
end

Capybara::Webkit.configure do |config|
  config.allow_unknown_urls
  config.timeout = 40
end

