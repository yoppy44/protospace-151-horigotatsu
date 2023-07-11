class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to prototype_path(@comment.prototype) # 今回の実装には関係ありませんが、このようにPrefixでパスを指定することが望ましいです。
    else
      @comment.content = comment_params[:content]
      @prototype = Prototype.find(params[:prototype_id])
      @comments = @prototype.comments.includes(:user)
      redirect_to prototype_path(@prototype)
    end
  end

  def index
    @comment = Comment.new
    @prototype = Prototype.find(params[:prototype_id])
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end
