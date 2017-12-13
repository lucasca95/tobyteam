class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def new
        @comment = Comment.new
  end

  def edit
  end

  def show
  end

  def index
  end

  def create
    @comment = Comment.new(params.require(:comment).permit(:body, :commentable_id, :commentable_type))
        @comment.user = current_user
    if current_user.permit("Crear Comentario")

      if @comment.save
        redirect_to @comment.commentable, :notice => '¡Éxito al crear comentario!'
      else
        redirect_to @comment.commentable, :alert => @comment.errors.messages[:title]
      end
    else
      redirect_to @comment.commentable, :alert => "No tiene Permiso para Crear Comentario"
    end
  end

  def update
  end

  def destroy
    @comment = Comment.find(params[:id])
    if current_user.id == @comment.user.id
      Comment.destroy(params[:id])
      redirect_to @comment.commentable
    else
      redirect_to @comment.commentable, :alert  => "No es dueño de ese comentario"
    end 
  end
end
