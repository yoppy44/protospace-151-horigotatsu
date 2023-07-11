class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:show]
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profile, :occupation, :position])
  end

  def users_params
    params.require(:user).permit(:name, :profile, :occupation, :position).merge(user_id: current_user.id)
  end
end