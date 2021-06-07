class ApplicationController < ActionController::Base

    rescue_from CanCan::AccessDenied do |exception|
        redirect_to recipes_path, :alert => exception.message
    end
    
end
