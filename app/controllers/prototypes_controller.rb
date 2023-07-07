class PrototypesController < ApplicationController

  def index
    @user = User.find(params[:id])
    @name = @user.:name
  end

end
