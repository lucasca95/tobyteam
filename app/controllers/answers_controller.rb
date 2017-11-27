class AnswersController < ApplicationController
  def new
    @answer = Answer.new
  end

  def edit
  end

  def show
        @answer = Answer.find(params[:id])
        redirect_to @answer.question
  end

  def index
    @lista_answers = Answer.all
  end

  def create
      @answer = Answer.new(params.require(:answer).permit(:body, :question_id))
      @answer.user = current_user
      
    if @answer.save
      redirect_to @answer.question, :notice => '¡Respuesta agregada con éssito!'
    else
      redirect_to @answer.question, :alert => 'Error. Completar campo de respuesta.'
    end

  end

  def update
  end

  def destroy
  end
end
