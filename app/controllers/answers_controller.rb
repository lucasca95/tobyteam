class AnswersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
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
    if current_user.permit("Crear Respuesta")
        @answer = Answer.new(params.require(:answer).permit(:body, :question_id))
        @answer.user = current_user
        
      if @answer.save
        redirect_to @answer.question, :notice => '¡Respuesta agregada con éssito!'
      else
        redirect_to @answer.question, :alert => "Ocurrio un error al crear una Respuesta"
      end
    else
      redirect_to @answer.question, :alert => "No tiene Permiso para Crear Respuesta"
    end

  end

  def update
  end

  def destroy
  end
end
