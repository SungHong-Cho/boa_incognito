class ApplicationController < ActionController::Base
  protect_from_forgery
  layout "admin"
def after_sign_in_path_for(resource)
 abouts_path
end
end
