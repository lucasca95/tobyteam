class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def new
  end

  def edit
  end

  def show
    @usuario=User.find(params[:id])
    @myQuestions=@usuario.questions
    @myAnswers=@usuario.answers
  end

  def index
  end

  def create
    
  end

  def update
  end

  def destroy
  end

  def votar_pregunta 
    q = Question.find(params[:question])
    like = params[:like]
    if like
      if current_user.permit("Votar Pregunta Positivo")
        if !(q.vote(like, current_user))
          redirect_to q, :alert => "Error al guardar los cambios"
        else
          redirect_to q
        end
      else
         redirect_to q, :alert => "No tiene Permisos"
      end
    else
        if current_user.permit("Votar Pregunta Negativo")
          if !(q.vote(like, current_user))
            redirect_to q, :alert => "Error al guardar los cambios"
          else
            redirect_to q
          end
      else
         redirect_to q, :alert => "No tiene Permisos"
      end
    end
  end

  def votar_respuesta
    a = Answer.find(params[:answer])
    like = params[:like]
    if like
      if current_user.permit("Votar Respuesta Positivo")
        if !(a.vote(like, current_user))
          redirect_to a.question, :alert => "Error al guardar los cambios"
        else
          redirect_to a.question
        end
      else
         redirect_to a.question, :alert => "No tiene Permisos"
      end
    else
        if current_user.permit("Votar Respuesta Negativo")
          if !(a.vote(like, current_user))
            redirect_to a.question, :alert => "Error al guardar los cambios"
          else
            redirect_to a.question
          end
      else
         redirect_to a.question, :alert => "No tiene Permisos"
      end
    end
  end
end