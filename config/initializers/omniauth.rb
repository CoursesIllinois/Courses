# Initializer that sets up Omniauth providers
require 'openid/store/filesystem'
Rails.application.config.middleware.use OmniAuth::Builder do
  # Maybe we should switch from a file system to a store later
  provider :google_apps, OpenID::Store::Filesystem.new('/tmp'), :domain => "illinois.edu"
  provider :open_id, OpenID::Store::Filesystem.new('/tmp'),  :name => 'google', :identifier => 'https://www.google.com/accounts/o8/id'
end
