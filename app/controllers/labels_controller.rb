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
    @label = Label.find(params[:id])
  end



  def show
    @label = Label.find(params[:id])
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

    @label=Label.find(params[:id])

    params[:label][:title]=params[:label][:title].upcase.gsub(/[^A-Z]/, '')
    if @label.update(params.require(:label).permit(:title, :active))
      redirect_to labels_path
    else
      redirect_to edit_label_path, :alert =>"Ocurrio un error al modificar la etiqueta"
    end
    
    

  end



  def destroy
    @label=Label.find(params[:id])
    if @label.active
      @label.active = false
    else
      @label.active = true
    end
    if @label.save
      redirect_to labels_path
    else
      redirect_to new_label_path, :alert =>"Ocurrio un error al guardar la etiqueta"
    end
  end



end
