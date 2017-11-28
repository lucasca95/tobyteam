class LevelsController < ApplicationController
  def new
  end

  def edit
  end

  def show
  end

  def index
    @levels = Level.actualizar
  end

  def create
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
