class UniversitiesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def new
  end

  def edit
  end

  def show
    @university = University.find(params[:id])
  end

  def index
    @lista_facultades = University.all
  end

  def create
  end

  def update
  end

  def destroy
  end
end
