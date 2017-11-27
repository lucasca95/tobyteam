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
      @comment = Comment.new(params.require(:comment).permit(:body, :commentable_id, :commentable_type))
      @comment.user = current_user

    if @comment.save
      redirect_to @comment.commentable, :notice => '¡Éxito al crear comentario!'
    else
      redirect_to @comment.commentable, :alert => @comment.errors.messages[:title]
    end

  end

  def update
  end

  def destroy
  end
end
