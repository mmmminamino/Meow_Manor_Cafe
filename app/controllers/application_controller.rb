class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?


  # protected

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name,:last_name_kana,:first_name,:first_name_kana,:telephone_number])
  # end
  
   def after_sign_in_path_for(resource)
        case resource
         when Admin
            admin_root_path
         when Customer
            public_my_page_path
        end
   end
   
   protected
        def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up, keys:[:last_name,:last_name_kana,:first_name,:first_name_kana,:encrypted_password,:telephone_number])
        end
end
