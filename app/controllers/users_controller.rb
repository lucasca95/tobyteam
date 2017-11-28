class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def new
  end

  def edit
  end

  def show
    @usuario=User.find(params[:id])
    @usuario_actual=current_user
    @myQuestions=@usuario_actual.questions
  end

  def index
  end

  def create
    
  end

  def update
  end

  def destroy
  end

  def actualizar_nivel(user)
    @level = Level.actualizar.where("points <= #{user.points} ").first
    if (!@level.nil?)
        if (user.level.id != @level.id)
            user.level_id = @level.id
            user.save
        end
    end
  end

  def votar_pregunta 
    @id = params[:question]
    @q = Question.find(@id)
    @like = params[:like]
    if (@like == "true")
      @permiso = current_user.level.actions.where(name: "Votar Pregunta Positivo").first
      if @permiso.nil?
        redirect_to :controller => 'main', :action => 'sin_permiso'
      else
        @v = Vote.where(votable_id: params[:question],votable_type:"Question",user:current_user ).first
        if @v.nil?    
          @v = Vote.new
          @v.votable_id = @id
          @v.votable_type = "Question"
          @v.like = @like
          @v.user = current_user
          @q.user.points += @permiso.points
        else
          @v.like = @like
          current_user.points += @permiso.points
          @q.user.points += 2*@permiso.points
        end
        if @v.save
          if @q.user.save
            if @current_user.save
              redirect_to @q
            else
              redirect_to :controller => 'main', :action => 'error'
            end
          else
            redirect_to :controller => 'main', :action => 'error'
          end
        else
          redirect_to :controller => 'main', :action => 'error'
        end

      end
    else 
      @permiso = current_user.level.actions.where(name: "Votar Pregunta Negativo").first
      if @permiso.nil?
        redirect_to :controller => 'main', :action => 'sin_permiso'
      else
        @v = Vote.where(votable_id: params[:question],votable_type:"Question",user:current_user ).first
        if @v.nil?   
          @v = Vote.new
          @v.votable_id = @id
          @v.votable_type = "Question"
          @v.like = @like
          @v.user = current_user
          @q.user.points -= @permiso.points
        else
          @v.like = @like
          current_user.points -= @permiso.points
          @q.user.points -= 2*@permiso.points
        end
        if @v.save
          if @q.user.save
            if @current_user.save
              redirect_to @q
            else
              redirect_to :controller => 'main', :action => 'error'
            end
          else
            redirect_to :controller => 'main', :action => 'error'
          end
        else
          redirect_to :controller => 'main', :action => 'error'
        end
      end
    end
    actualizar_nivel(current_user)
  end

  def votar_respuesta
    @id = params[:answer]
    @q = Answer.find(@id)
    @like = params[:like]
    if (@like == "true")
      @permiso = current_user.level.actions.where(name: "Votar Respuesta Positivo").first
      if @permiso.nil?
        redirect_to :controller => 'main', :action => 'sin_permiso'
      else
        @v = Vote.where(votable_id: params[:answer],votable_type:"Answer",user:current_user ).first
        if @v.nil?    
          @v = Vote.new
          @v.votable_id = @id
          @v.votable_type = "Answer"
          @v.like = @like
          @v.user = current_user
          @q.user.points += @permiso.points
        else
          @v.like = @like
          current_user.points += @permiso.points
          @q.user.points += 2*@permiso.points
        end
        if @v.save
          if @q.user.save
            if @current_user.save
              redirect_to @q
            else
              redirect_to :controller => 'main', :action => 'error'
            end
          else
            redirect_to :controller => 'main', :action => 'error'
          end
        else
          redirect_to :controller => 'main', :action => 'error'
        end

      end
    else 
      @permiso = current_user.level.actions.where(name: "Votar Respuesta Negativo").first
      if @permiso.nil?
        redirect_to :controller => 'main', :action => 'sin_permiso'
      else
        @v = Vote.where(votable_id: params[:answer],votable_type:"Answer",user:current_user ).first
        if @v.nil?   
          @v = Vote.new
          @v.votable_id = @id
          @v.votable_type = "Answer"
          @v.like =@like
          @v.user = current_user
          @q.user.points -= @permiso.points
        else
          @v.like = @like
          current_user.points -= @permiso.points
          @q.user.points -= 2*@permiso.points
        end
        if @v.save
          if @q.user.save
            if @current_user.save
              redirect_to @q
            else
              redirect_to :controller => 'main', :action => 'error'
            end
          else
            redirect_to :controller => 'main', :action => 'error'
          end
        else
          redirect_to :controller => 'main', :action => 'error'
        end
      end
    end
    actualizar_nivel(current_user)
  end
end