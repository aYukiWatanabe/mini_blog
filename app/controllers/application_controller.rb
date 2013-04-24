class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from ActiveRecord::RecordNotFound do |ex|
    render 'errors/x404', status: :not_found
  end
end
