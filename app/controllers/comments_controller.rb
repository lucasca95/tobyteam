class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def new
        @comment = Comment.new
        @question= Question.find(1)
  end

  def edit
  end

  def show
  end

  def index
  end

  def create
    if current_user.permit("Crear Respuesta")
        @comment = Comment.new(params.require(:comment).permit(:body, :commentable_id, :commentable_type))
        @comment.user = current_user

      if @comment.save
        redirect_to :back, :notice => '¡Éxito al crear comentario!'
      else
        redirect_to :back, :alert => @comment.errors.messages[:title]
      end
    else
      redirect_to :back, :alert => "No tiene Permiso para Crear Pregunta"
    end
  end

  def update
  end

  def destroy
  end
end
