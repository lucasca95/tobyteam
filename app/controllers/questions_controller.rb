class QuestionsController < ApplicationController
    before_action :authenticate_user!, except: [:show,:index]
  def new
    @question = Question.new
  end

  def edit
  end

  def show
  end

  def index
    @listaQuestions=Question.all
  end

  def create
    @q = Question.new(params.require(:question).permit(:title, :body))
    @q.user = current_user
    if @q.save 
      redirect_to questions_path
    else
      redirect_to :controller => 'main', :action => 'error'
    end 
  end

  def update
  end

  def destroy
  end
end
