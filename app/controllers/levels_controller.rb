class LevelsController < ApplicationController
  before_action :authenticate_user!

  def new
    if ( current_user.permit("Administrar") )
      @level = Level.new
    else
      redirect_to :controller => 'main', :action => 'sin_permiso'
    end
  end

  def edit
    @level = Level.find(params[:id])
  end

  def show
    @level = Level.find(params[:id])
  end

  def index
    @levels = Level.actualizar
  end

  def create

    @level = Level.new(params.require(:level).permit(:name, :points, action_ids: []))
    @level.name = @level.name.upcase.gsub(/[^A-Z]/, '')
    if @level.save
      redirect_to levels_path
    else
      redirect_to new_level_path, :alert => @level.errors.messages[:name]
    end

  end

  def update
    if Level.update(params.require(:level).permit(:name, :points, action_ids: []))
      redirect_to levels_path
    else
      redirect_to :back , :alert => "Ocurrio un error"
    end
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
