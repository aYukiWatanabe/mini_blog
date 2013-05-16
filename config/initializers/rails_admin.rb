RailsAdmin.config do |config|
  config.authorize_with :cancan
  config.attr_accessible_role { :admin }
end
