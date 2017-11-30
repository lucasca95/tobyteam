class LevelsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def new
    if ( current_user.permit("Administrar") )
      @level = Level.new
    else
      redirect_to :controller => 'main', :action => 'sin_permiso'
    end
  end

  def edit
  end

  def show
  end

  def index
    @levels = Level.actualizar
  end

  def create

    @level = Level.new(params.require(:level).permit(:name, :points, actions: []))
    @level.name = @level.name.upcase.gsub(/[^A-Z]/, '')
    if @level.save
      redirect_to levels_path
    else
      redirect_to new_level_path, :alert => @level.errors.messages[:name]
    end

  end

  def update
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
