class QuestionsController < ApplicationController
    before_action :authenticate_user!, except: [:show,:index]
  def new
    if current_user.permit("Crear Pregunta")
      @question = Question.new
      @all_labels = Label.where(active: true).all
    else
      redirect_to :root, :alert => "No tiene Permiso para Crear Pregunta"
    end
  end
  def edit
  end

  def show
    @question = Question.find(params[:id])
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
    else
      @listaQuestions=Question.created.search(params[:id2])
    end
    
    
    #rompe

  end

  def create
    #@l = Label.find(:id)
    @q = Question.new(params.require(:question).permit(:title, :body, label_ids: []))
    @q.user = current_user
    
    if ((@q.label_ids.length>0) and (@q.label_ids.length<6))

      if @q.save 
        redirect_to questions_path
      else 
        redirect_back(fallback_location: root_path, notice: "Something went wrong!")

      end
     
    else  
      redirect_back(fallback_location: :back)
    end
       
  end

  def update
  end

  def destroy
  end

  def set_best
    question = Question.find(params[:question])
    ans = Answer.find(params[:answer])
    if current_user.id == question.user.id
      question.set_best(ans)
      redirect_to question
    else
      redirect_to :back, :alert => "La respuesta seleccionada no es de una Pregunta propia"
    end
  end

end
