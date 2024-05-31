class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

       def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:nickname, :email, :password)}

            devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:nickname, :email, :password, :current_password)}
       end


       def page_not_found
        respond_to do |format|
          format.html { render template: 'errors/not_found_error', layout: 'errors/not_found_error', status: 404 }
          format.all  { render nothing: true, status: 404 }
        end
      end

      def server_error
        respond_to do |format|
          format.html { render template: 'errors/internal_server_error', layout: 'layouts/error', status: 500 }
          format.all  { render nothing: true, status: 500}
        end
      end
end
