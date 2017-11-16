class AnswersController < ApplicationController
  def new
    @answer = Answer.new
    @question= Question.find(2)
  end

  def edit
  end

  def show
        @answer = Answer.find(params[:id])
  end

  def index
    @lista_answers = Answer.all
  end

  def create
      @answer = Answer.new(params.require(:answer).permit(:body, :question_id))
      @answer.user = current_user
      
    if @answer.save
      redirect_to answers_path
    else
      redirect_to :controller => 'main', :action => 'error'
    end

  end

  def update
  end

  def destroy
  end
end
