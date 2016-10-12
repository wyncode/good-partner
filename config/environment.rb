# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

CASClient::Frameworks::Rails::Filter.configure(
   :cas_base_url => "http://login.wyncode.co",
   :enable_single_sign_out => true,
   :service_url => "https://hidden-brook-62410.herokuapp.com/"
)
