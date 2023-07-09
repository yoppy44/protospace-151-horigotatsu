class PrototypesController < ApplicationController

  def index
    
  end

  def message_params
    params.require(:user).permit(:content, :image).merge(user_id: current_user.id)
  end


  def new
    @prototype = Prototype.new
   
  end

  def create
   @prototype = Prototype.new(prototype_params)
    if 
      # 保存成功時の処理
      @prototype.save
      redirect_to root_path
    else
       # 保存失敗時の処理
       render :new
    end
  end
  
  private
  
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

end
