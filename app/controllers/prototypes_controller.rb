class PrototypesController < ApplicationController

  def index
    @prototypes = Prototype.all
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

  def show
    @prototype = Prototype.find(params[:id])
    @user = @prototype.user
    @title = @prototype.title
    @catch_copy = @prototype.catch_copy
    @concept = @prototype.concept
  end

  def edit
    @prototype = Prototype.find(params[:id])
      if user_signed_in? && current_user.id == @prototype.user_id
        render :edit
      elsif user_signed_in?  
        redirect_to root_path
      else
        redirect_to new_user_session_path
      end    
  end  
  
  def update
    prototype = Prototype.find(params[:id])
    if prototype.update(prototype_params)
      redirect_to prototype_path
    else
      redirect_to  edit_prototype_path
    end  
  end

  def destroy
    prototype = Prototype.find(params[:id])
    if user_signed_in? && current_user.id == prototype.user_id
      prototype.destroy
      redirect_to root_path
    else
      redirect_to new_user_session_path
    end  
  end  

  private
  
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

end
