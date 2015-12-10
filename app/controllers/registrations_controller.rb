class RegistrationsController < Devise::RegistrationsController
  protected

  # def after_sign_up_path_for(resource)
  #   edit_user_path(current_user)
    
  # end

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :avatar, :name, :played, :wins, :points)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :avatar, :name, :played, :wins, :points)
  end
end