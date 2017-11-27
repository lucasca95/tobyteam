class QuestionsController < ApplicationController
    before_action :authenticate_user!, except: [:show,:index]
  def new
    @question = Question.new
    @all_labels = Label.where(active: true).all

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
    @listaQuestions=Question.all
  end

  def create
    #@l = Label.find(:id)
    @q = Question.new(params.require(:question).permit(:title, :body, label_ids: []))
    @q.user = current_user
    
    if ((@q.label_ids.length>0) and (@q.label_ids.length<6))

      if @q.save 
        redirect_to questions_path
      else 
        
        redirect_to :controller => 'main', :action => 'no_se_pudo_guardar'
      end
     
    else redirect_to :controller => 'main', :action => 'error'
    end
       
  end

  def update
  end

  def destroy
  end

  def set_best
    answer = Answer.find(params[:answer])
    question = Question.find(params[:question])
    if answer.question.id == question.id
      question.answer = answer
      question.save  
    end
    redirect_to question
  end
end
