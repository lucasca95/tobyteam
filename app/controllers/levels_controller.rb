class LevelsController < ApplicationController
  before_action :authenticate_user!
  
  def new
    if ( current_user.permit("Administrar") )
      @level = Level.new
    else
      redirect_to :root, :alert => "No tiene permisos para Administrar"
    end
  end

  def show
    @level = Level.find(params[:id])
  end

  def index
    if ( current_user.permit("Administrar") )
      @levels = Level.actualizar
    else
      redirect_to :root, :alert => "No tiene permisos para Administrar"
    end
  end


  def edit
    @level = Level.find(params[:id])
  end

  def create

    @level = Level.new(params.require(:level).permit(:name, :points, action_ids: []))
    @level.name = @level.name.upcase.gsub(/[^A-Z]/, '')
    if @level.save
      redirect_to levels_path
    else
      redirect_to new_level_path, :alert => "Error al guardar el nivel. ¿Será que el nombre o los puntos están repetidos?"
    end

  end


  def update
    @level = Level.update(params.require(:level).permit(:name, :points, action_ids: [])).last
    @level.name = @level.name.upcase.gsub(/[^A-Z]/, '')
    if @level.save
      redirect_to levels_path
    else
      redirect_to edit_level_path, :alert => "Error al modificar el nivel. ¿Será que el nombre o los puntos están repetidos?"
    end
   # if Level.update(params.require(:level).permit(:name, :points, action_ids: []))
   #   redirect_to levels_path
   # else
   #   redirect_to :back , :alert => "Ocurrio un error al actualizar nivel"
   # end
  end






  def destroy
    l = Level.find(params[:id])
    if l.delete
      redirect_to levels_path
    else
      redirect_to levels_path, :alert => "Error al eliminar el nivel"
    end
  end
end
