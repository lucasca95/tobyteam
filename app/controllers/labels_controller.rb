class LabelsController < ApplicationController
  def new
    accion=current_user.level.actions.where(name:"Crear Etiqueta").first
    if !( accion.nil? )
      @label = Label.new
    else
      redirect_to :controller => 'main', :action => 'sin_permiso'
    end
  end

  def edit
  end

  def show
  end

  def index
    @lista_labels = Label.all
  end

  def create

    @label = Label.new(params.require(:label).permit(:title, :active))

    if @label.save
      redirect_to labels_path
    else
      redirect_to :controller => 'main', :action => 'error'
    end

  end

  def update
  end

  def destroy
  end
end
