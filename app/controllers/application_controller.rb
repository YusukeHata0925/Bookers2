class ApplicationController < ActionController::Base


	  before_action :configure_permitted_parameters, if: :devise_controller?

	  protected
       def configure_permitted_parameters
         # サインアップ時にnameのストロングパラメータを追加
         devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
         devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
         devise_parameter_sanitizer.permit(:account_update, keys: [:username])
         # アカウント編集の時にnameとprofileのストロングパラメータを追加
         devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile])
       end

       def after_sign_in_path_for(resource)
           books_path
       end

       def after_sign_out_path_for(resource)
           new_user_session_path
       end

      
end
