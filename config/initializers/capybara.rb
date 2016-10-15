require 'capybara'
require 'capybara/poltergeist'
Capybara.javascript_driver = :poltergeist

Capybara.configure do |config|
  config.run_server = false
  config.default_driver = :poltergeist
  config.app_host = 'https://localhost:3000' # change url
end
