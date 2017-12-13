class LabelsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def new
    if ( current_user.permit("Administrar") )
      @label = Label.new
      @label.active = true
    else
      redirect_to :root, :alert => "No tiene permisos para Administrar"
    end
  end

  def edit
  end

  def show
    @label=Label.find(params[:id])
  end

  def index
    @lista_labels = Label.all
  end

  def create

    @label = Label.new(params.require(:label).permit(:title, :active))
    @label.title = @label.title.upcase.gsub(/[^A-Z]/, '')
    if @label.save
      redirect_to labels_path
    else
      redirect_to new_label_path, :alert =>"Ocurrio un error al guardar la etiqueta"
    end

  end

  def update
  end

  def destroy
    @label=Label.find(params[:id])
    @label.active = false
    if @label.save
      redirect_to labels_path
    else
      redirect_to new_label_path, :alert =>"Ocurrio un error al guardar la etiqueta"
    end
  end
end
