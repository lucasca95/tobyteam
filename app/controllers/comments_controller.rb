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
        redirect_to @comment.commentable
    else
      redirect_to :controller => 'main', :action => 'error'
    end

  end

  def update
  end

  def destroy
  end
end
