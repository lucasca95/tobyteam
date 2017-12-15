class QuestionsController < ApplicationController
    before_action :authenticate_user!, except: [:show,:index]
  def new
    if current_user.permit("Crear Pregunta")
      @question = Question.new
      @all_labels = Label.where(active: true).all
    else
      redirect_to :root, :alert => "No tiene permiso para crear pregunta"
    end
  end
  def edit
  end

  def show
    @question = Question.find(params[:id])
    @question.add_visit(current_user)
    @q_answers = @question.answers
    @q_comments = @question.comments
    @new_a = Answer.new
    @new_c = Comment.new
    @new_c.commentable = @question
  end

  def index
    @type = params[:type]
    case @type
    when "1"
      @listaQuestions=Question.unanswer
    when "2"
      @listaQuestions=Question.visited
    when "3"
      @listaQuestions=Question.populars
    else
      @listaQuestions=Question.created.search(params[:id2])
    end
    

  end

  def create
    #@l = Label.find(:id)
    @all_labels = Label.where(active: true).all
    @question = Question.new(params.require(:question).permit(:title,:visits, :body, label_ids: []))
    @question.user = current_user
    
    if ((@question.label_ids.length>0) and (@question.label_ids.length<6))

      if @question.save 
        redirect_to questions_path
        flash[:notice] = "¡Pregunta creada con éxito!"
      else 
          render 'new'
          flash[:alert] = "Error al crear la pregunta. Falta completar información: asegúrese que la pregunta tenga Título y Cuerpo."
      end


     
    else
      flash[:alert]="La cantidad de etiquetas seleccionas es incorreta. Ingrese cantidad valida (1..5)"
        render 'new'

    end
       
  end

  def update
  end

  def destroy
    @question = Question.find(params[:id])
    if current_user.id == @question.user.id
      Question.destroy(params[:id])
      redirect_to questions_path
    else
      redirect_to @question, :alert  => "No es dueño de esa Pregunta"
    end 
  end

  def set_best
    question = Question.find(params[:question])
    ans = Answer.find(params[:answer])
    if current_user.id == question.user.id
      question.set_best(ans,current_user)
      redirect_to question
    else
      redirect_to :back, :alert => "La respuesta seleccionada no es de una Pregunta propia"
    end
  end

end
