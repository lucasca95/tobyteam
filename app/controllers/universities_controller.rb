class UniversitiesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]


  def new
    if ( current_user.permit("Administrar") )
      @university = University.new
    else
      redirect_to :root, :alert => "No tiene permisos para Administrar"
    end
  end

  def edit
  end

  def show
  end

  def index
    @lista_facultades = University.all
  end

  def create
    @university = University.new(params.require(:university).permit(:name, :province, :url))
    @university.name = @university.name.upcase
    @university.province = @university.province.upcase
    if @university.save
      redirect_to universities_path
    else
      redirect_to new_university_path, :alert =>"Ocurrio un error al guardar la universidad"
    end
  end

  def update
  end

  def destroy
    university=University.find(params[:id])
    university.users.update_all("university_id=null")
    university.destroy
    redirect_to universities_path
  end
end
