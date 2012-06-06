# Default Settings

# Domain name; for custom setup, change this via Rails console after migrating and seeding datbase
# !!! THIS NEEDS TO BE CHANGED IN development.rb and production.rb AS WELL !!!
Settings.domain_name = case Rails.env
when 'development'
  'nitch.dev'
when 'production'
  'nitch.com'
end

# Reserved subdomains
Settings.reserved_subdomains = %w(
  www
  help
  auth
  secure
  store
  shop
  cart
)

Settings.nitch_privacy = %w(
  public
  invite
  private
)