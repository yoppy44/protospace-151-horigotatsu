class PrototypesController < ApplicationController

  def index
  end

  def message_params
    params.require(:user).permit(:content, :image).merge(user_id: current_user.id)

end
